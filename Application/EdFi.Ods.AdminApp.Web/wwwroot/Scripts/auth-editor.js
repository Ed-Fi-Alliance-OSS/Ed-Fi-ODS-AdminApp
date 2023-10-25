// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
const ACTIONS = {
    create: 0,
    read: 1,
    update: 2,
    delete: 3,
    readChanges: 4
}
var updateCell = function (row, action) {
    var resourceId = $("#resource-claim-auth").data("resource-id");
    var actionCell = row.find("td.".concat(action, "-action-cell"));
    var actionCellLabel = actionCell.find("span:first-child");
    var authStrategiesOverride = actionCell.find(".auth-strategy-name").map(function () { return this.innerHTML });
    var dropdown = '';
    if (actionCell.data("existing-action") === "True") {
        var dropdownId = "resource-auth-dropdown-".concat(resourceId, "-", action);
        dropdown = $("<select multiple class='auth-multiple-dropdown' id='".concat(dropdownId, "'></select>"));
        $(authStrategiesOptions).each(function () {
            var selected = $.inArray(this.Text, authStrategiesOverride) > -1;
            if (isDefaultAuthStrategy(action, Number(this.Value))) {
                if (actionCellLabel.data('is-inherited') === "True") {
                    dropdown.append($("<option></option>").val(this.Value).html(this.Text.concat("(Default Strategy)")).attr("disabled", this.Disabled).attr("data-default-is-inherited", true).attr("selected", selected));
                } else {
                    dropdown.append($("<option></option>").val(this.Value).html(this.Text.concat("(Default Strategy)")).attr("disabled", this.Disabled).attr("selected", selected));
                }
            } else {
                dropdown.append($("<option></option>").val(this.Value).html(this.Text).attr("disabled", this.Disabled).attr("selected", selected));
            }
        });
        actionCell.html('');
        actionCell.html(dropdown);
    }
};

var isDefaultAuthStrategy = function (action, authStrategyId) {
    
    const index = ACTIONS[action];
    if (authStrategyId === 0)
        return false;
    var result = defaultAuthStrategies[index].AuthorizationStrategies.filter(a => a.AuthStrategyId === authStrategyId);

    return result.length > 0;
}

var getUpdateResourceUrl = function (resourceId, claimSetId) {
    return "".concat(getUpdatedResourceUrl, "?claimSetId=").concat(claimSetId, "&resourceClaimId=").concat(resourceId);
};

var showSpinner= function(shouldShow) {
    if (shouldShow) {
        $("#auth-modal-spinner").removeClass("hidden");
        $("#auth-table").addClass("hidden");
    } else {
        $("#auth-modal-spinner").addClass("hidden");
        $("#auth-table").removeClass("hidden");
    }
}

var updateRowAfterEdit = function (row, resourceUpdateUrl) {
    $.ajax({
        type: "GET",
        dataType: "json",
        url: resourceUpdateUrl,
        success: function success(updatedResource) {
            var defaultStrategies = updatedResource.DefaultAuthStrategiesForCRUD;
            var authStrategyOverrides = updatedResource.AuthStrategyOverridesForCRUD;
            var readCell = row.find(".read-action-cell");
            var createCell = row.find(".create-action-cell");
            var updateCell = row.find(".update-action-cell");
            var deleteCell = row.find(".delete-action-cell");
            var readChangesCell = row.find(".readchanges-action-cell");
            var editCell = $("a.edit-resource-check");
            updateCellAfterEdit(readCell, defaultStrategies[1], authStrategyOverrides[1]);
            updateCellAfterEdit(createCell, defaultStrategies[0], authStrategyOverrides[0]);
            updateCellAfterEdit(updateCell, defaultStrategies[2], authStrategyOverrides[2]);
            updateCellAfterEdit(deleteCell, defaultStrategies[3], authStrategyOverrides[3]);
            if (readChangesCell != null) { 
                updateCellAfterEdit(readChangesCell, defaultStrategies[4], authStrategyOverrides[4]);
            }
            if (editCell != null) {
                $("a.override-auth").replaceWith('<a class="override-auth"> <span class="fa fa-pencil action-icons"></span></a>');
                $(".override-auth").click(overrideAuth);
            }
            showSpinner(false);
        },
        error: function error() {
            showSpinner(false);
        }
    });
};

var updateCellAfterEdit = function (cell, defaultStrategy, authStrategyOverride) {
    var strategyName = cell.find("span:first-child");
    if (authStrategyOverride != null) {
        $.each(authStrategyOverride.AuthorizationStrategies, function (key, authStrategy) {
            cell.append(`<span class="auth-strategy-name" data-is-inherited="${authStrategy.IsInheritedFromParent}">${authStrategy.DisplayName}</span>`);
            if (authStrategy.IsInheritedFromParent) {
                cell.append('<span class="overridden-strategy inherited-override">(Overridden)</span>');
            } else {
                cell.append('<span class="overridden-strategy">(Overridden)</span>');
            }
            cell.append("<br />");
        });
        
    } else {
        if (defaultStrategy != null) {
            strategyName.html(defaultStrategy.DisplayName);
            if (defaultStrategy.IsInheritedFromParent) {
                cell.find("span:nth-child(2)")
                    .replaceWith('<span class="default-strategy inherited-strategy">(Default)</span>');
            } else {
                cell.find("span:nth-child(2)")
                    .replaceWith('<span class="default-strategy">(Default)</span>');
            }
        }
    }
}

var overrideStrategies = function () {
    var row = $("#resource-claim-auth").closest("tr");
    var claimSetId = parseInt($("#ClaimSetId").val());
    var resourceId = $("#resource-claim-auth").data("resource-id");
    var resourceName = $("#resource-claim-name").text();
    var readDropdown = row.find(".read-action-cell select");
    var createDropdown = row.find(".create-action-cell select");
    var updateDropdown = row.find(".update-action-cell select");
    var deleteDropdown = row.find(".delete-action-cell select");
    var readChangesDropdown = row.find(".readchanges-action-cell select");
    var isReadSelectedOptionDefault = readDropdown.find('option:selected').text().trim().includes('(Default Strategy)');
    var isCreateSelectedOptionDefault = createDropdown.find('option:selected').text().trim().includes('(Default Strategy)');
    var isUpdateSelectedOptionDefault = updateDropdown.find('option:selected').text().trim().includes('(Default Strategy)');
    var isDeleteSelectedOptionDefault = deleteDropdown.find('option:selected').text().trim().includes('(Default Strategy)');
    if (readChangesDropdown != null) {
        var isReadChangesSelectedOptionDefault = readChangesDropdown.find('option:selected').text().trim().includes('(Default Strategy)');
        var postData = {
            'ClaimSetId': claimSetId,
            'ResourceClaimId': resourceId,
            'AuthorizationStrategyForCreate': isCreateSelectedOptionDefault ? 0 : createDropdown.val(),
            'AuthorizationStrategyForRead': isReadSelectedOptionDefault ? 0 : readDropdown.val(),
            'AuthorizationStrategyForUpdate': isUpdateSelectedOptionDefault ? 0 : updateDropdown.val(),
            'AuthorizationStrategyForDelete': isDeleteSelectedOptionDefault ? 0 : deleteDropdown.val(),
            'AuthorizationStrategyForReadChanges': isReadChangesSelectedOptionDefault ? 0 : readChangesDropdown.val()
        }
    }
    else {
        var postData = {
            'ClaimSetId': claimSetId,
            'ResourceClaimId': resourceId,
            'AuthorizationStrategyForCreate': isCreateSelectedOptionDefault ? 0 : createDropdown.val(),
            'AuthorizationStrategyForRead': isReadSelectedOptionDefault ? 0 : readDropdown.val(),
            'AuthorizationStrategyForUpdate': isUpdateSelectedOptionDefault ? 0 : updateDropdown.val(),
            'AuthorizationStrategyForDelete': isDeleteSelectedOptionDefault ? 0 : deleteDropdown.val()
        }
    };
    showSpinner(true);
    $.ajax({
        type: "POST",
        dataType: "html",
        url: authStrategyOverrideUrl,
        data: addAntiForgeryToken(postData),
        success: function success() {
            resourceUpdateUrl = getUpdateResourceUrl(resourceId, claimSetId);
            updateRowAfterEdit(row, resourceUpdateUrl);
            ClaimSetToastrMessage("".concat(resourceName, " authorization strategies edited successfully"), true);
            ClaimSetWarningMessage(true);
        },
        error: function error(data) {
            document.body.scrollTop = document.documentElement.scrollTop = 0;
            showSpinner(false);
            ClaimSetToastrMessage("There was an error in overriding strategies on ".concat(resourceName).concat(data.responseText));
        }
    });
};

var resetStrategiesToDefault = function () {
    var row = $("#resource-claim-auth").closest("tr");
    var claimSetId = parseInt($("#ClaimSetId").val());
    var resourceId = $("#resource-claim-auth").data("resource-id");
    var resourceName = $("#resource-claim-name").text();
    var readCell = row.find(".read-action-cell");
    var createCell = row.find(".create-action-cell");
    var updateCell = row.find(".update-action-cell");
    var deleteCell = row.find(".delete-action-cell");
    var readChangesCell = row.find(".readchanges-action-cell");
    var postData = {
        'ClaimSetId': claimSetId,
        'ResourceClaimId': resourceId
    };
    if (!(readCell.find("span:nth-child(2)").hasClass("default-strategy") &&
        createCell.find("span:nth-child(2)").hasClass("default-strategy") &&
        updateCell.find("span:nth-child(2)").hasClass("default-strategy") &&
        deleteCell.find("span:nth-child(2)").hasClass("default-strategy") &&
        (!readChangesCell || readChangesCell.find("span:nth-child(2)").hasClass("default-strategy")))) {
        showSpinner(true);
        $.ajax({
            type: "POST",
            dataType: "html",
            url: resetAuthStrategyUrl,
            data: addAntiForgeryToken(postData),
            success: function success() {
                resourceUpdateUrl = getUpdateResourceUrl(resourceId, claimSetId);
                updateRowAfterEdit(row, resourceUpdateUrl);
                ClaimSetToastrMessage("".concat(resourceName, " authorization strategies reset to default successfully"), true);
                ClaimSetWarningMessage(true);
            },
            error: function error(data) {
                document.body.scrollTop = document.documentElement.scrollTop = 0;
                showSpinner(false);
                ClaimSetToastrMessage("There was an error in resetting overrides on ".concat(resourceName).concat(data.responseText));
            }
        });
    }
};

var overrideAuth = function(e) {
    e.preventDefault();
    var row = $("#resource-claim-auth").closest("tr");
    row.attr("data-state", "edited");
    updateCell(row, "create");
    updateCell(row, "read");
    updateCell(row, "update");
    updateCell(row, "delete");
    var readChangesCell = document.getElementsByClassName("readchanges-action-cell");
    if (readChangesCell.length > 0) {
        updateCell(row, "readchanges");
    }
    $("a.override-auth").replaceWith('<a class="edit-resource-check"> <span class="fa fa-check action-icons"></span></a>');
    $(".edit-resource-check").click(overrideStrategies);
};
$(function () {
    $(".override-auth").click(overrideAuth);
    $(".reset-auth").click(resetStrategiesToDefault);
});
