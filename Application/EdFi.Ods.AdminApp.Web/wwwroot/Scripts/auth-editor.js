// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

const ACTIONS = {
    create: 0,
    read: 1,
    update: 2,
    delete: 3,
    readchanges: 4
}

const defaultTextDropDownList = "Please select values";
var updateCell = function (row, action) {
    var resourceId = $("#resource-claim-auth").data("resource-id");
    var actionCell = row.find("td.".concat(action, "-action-cell"));
    var actionCellLabel = actionCell.find("span:first-child");
    var dropdown = '';
    var defaultText = '';
    var selectedValues = [];
    if (actionCell.data("existing-action") === "True") {
        var dropdownId = "resource-auth-dropdown-".concat(resourceId, "-", action);
        if (odsVersion === 6) {
            dropdown = $("<select multiple class='auth-multiple-dropdown' id='".concat(dropdownId, "'></select>"));
        }
        else {
            dropdown = $("<select class='auth-dropdown auth-dropdown-v5' id='id='".concat(dropdownId, "'></select>"));
        }
        $(authStrategiesOptions).each(function () {
            var selected = isSelected(action, Number(this.Value));
            if (defaultText === "" && selected) {
                defaultText = this.Text;
                selectedValues.push(this.Value);
            } else if (selected) {
                selectedValues.push(this.Value);
            }
            if (isDefaultAuthStrategy(action, Number(this.Value))) {
                if (actionCellLabel.data('is-inherited') === "True") {
                    dropdown.append($("<option></option>").val(this.Value).html(this.Text.concat(" (Default Strategy)")).attr("title", this.Text.concat(" (Default Strategy)")).attr("disabled", this.Disabled).attr("data-default-is-inherited", true).attr("selected", selected).attr("data-default-auth", true));
                } else {
                    dropdown.append($("<option></option>").val(this.Value).html(this.Text.concat(" (Default Strategy)")).attr("title", this.Text.concat(" (Default Strategy)")).attr("disabled", this.Disabled).attr("selected", selected).attr("data-default-auth", true));
                }
            } else {
                dropdown.append($("<option></option>").val(this.Value).html(this.Text).attr("title", this.Text).attr("disabled", this.Disabled).attr("selected", selected).attr("data-default-auth", false));
            }
        });
        actionCell.html('');
        actionCell.html(dropdown);
        if (odsVersion === 6) {
            if (selectedValues.length > 1) {
                defaultText = "Items selected: " + selectedValues.length;
            }
            else if (defaultText == '') {
                defaultText = defaultTextDropDownList
            }
            $("#".concat(dropdownId)).CreateMultiCheckBox({ width: '380px', height: '200px', defaultText: defaultText });
        }

    }
};

var isDefaultAuthStrategy = function (action, authStrategyId) {
    
    const index = ACTIONS[action];
    if (authStrategyId === 0 || defaultAuthStrategies[index] === undefined)
        return false;
    var result = defaultAuthStrategies[index].AuthorizationStrategies.filter(a => a.AuthStrategyId === authStrategyId);

    return result.length > 0;
}

var isSelected = function (action, authStrategyId) {
    const index = ACTIONS[action];
    var result = false;
    if (authStrategyId === 0)
        return false;

    if (authStrategiesOverrides[index] == null) {
        result = isDefaultAuthStrategy(action, authStrategyId);
    }
    else {
        result = authStrategiesOverrides[index].AuthorizationStrategies.filter(a => a.AuthStrategyId === authStrategyId).length > 0;
    }
    return result;
};

var getValuesFromDropDown = function (action, values) {
    var result = [];
    if (Array.isArray(values)) {
        $.each(values, function (index, value) {
            if (!isDefaultAuthStrategy(action, Number(value))) {
                result.push(value);
            }
        });
        if (result.length === 0) {
            result = 0;
        }
    }
    else if (!isNaN(values)) {
        result = Number(values);
    }
    else {
        result = 0;
    }
    return result;
};

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
            defaultAuthStrategies = updatedResource.DefaultAuthStrategiesForCRUD;
            authStrategiesOverrides = updatedResource.AuthStrategyOverridesForCRUD;
            var readCell = row.find(".read-action-cell");
            var createCell = row.find(".create-action-cell");
            var updateCell = row.find(".update-action-cell");
            var deleteCell = row.find(".delete-action-cell");
            var readChangesCell = row.find(".readchanges-action-cell");
            var editCell = $("a.edit-resource-check");
            updateCellAfterEdit(readCell, defaultAuthStrategies[1], authStrategiesOverrides[1]);
            updateCellAfterEdit(createCell, defaultAuthStrategies[0], authStrategiesOverrides[0]);
            updateCellAfterEdit(updateCell, defaultAuthStrategies[2], authStrategiesOverrides[2]);
            updateCellAfterEdit(deleteCell, defaultAuthStrategies[3], authStrategiesOverrides[3]);
            if (readChangesCell != null) { 
                updateCellAfterEdit(readChangesCell, defaultAuthStrategies[4], authStrategiesOverrides[4]);
            }
            if (editCell != null) {
                $(".edit-resource-check").hide();
                $(".override-auth").show();
            }
            showSpinner(false);
        },
        error: function error() {
            showSpinner(false);
        }
    });
};

var updateCellAfterEdit = function (cell, defaultStrategy, authStrategyOverride) {
    cell.html("");
    if (authStrategyOverride != null) {
        $.each(authStrategyOverride.AuthorizationStrategies, function (key, authStrategy) {
            cell.append(`<span class="auth-strategy-name" data-is-inherited="${authStrategy.IsInheritedFromParent}">${authStrategy.DisplayName}</span>  `);
            if (authStrategy.IsInheritedFromParent) {
                cell.append('<span class="overridden-strategy inherited-override">(Overridden)</span>');
            } else {
                cell.append('<span class="overridden-strategy">(Overridden)</span>');
            }
            cell.append("<br />");
        });
        
    } else {
        if (defaultStrategy != null) {
            $.each(defaultStrategy.AuthorizationStrategies, function (key, authStrategy) {
                cell.append(`<span class="auth-strategy-name" data-is-inherited="${authStrategy.IsInheritedFromParent}" data-default-strategy="${authStrategy.DisplayName}">${authStrategy.DisplayName}</span>  `);
                if (authStrategy.IsInheritedFromParent) {
                    cell.append('<span class="default-strategy inherited-strategy">(Default)</span>');
                } else {
                    cell.append('<span class="default-strategy">(Default)</span>');
                }
                cell.append("<br />");
            });
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

    var valuesForCreate = [];
    var valuesForRead = [];
    var valuesForUpdate = [];
    var valuesForDelete = [];
    var valuesForReadChanges = [];

    if (odsVersion === 6) {
        isReadSelectedOptionDefault = row.find('.read-action-cell > div.MultiCheckBox > span.selected-text').text().includes(defaultTextDropDownList);
        isCreateSelectedOptionDefault = row.find('.create-action-cell > div.MultiCheckBox > span.selected-text').text().trim().includes(defaultTextDropDownList);
        isUpdateSelectedOptionDefault = row.find('.update-action-cell > div.MultiCheckBox > span.selected-text').text().trim().includes(defaultTextDropDownList);
        isDeleteSelectedOptionDefault = row.find('.delete-action-cell > div.MultiCheckBox > span.selected-text').text().trim().includes(defaultTextDropDownList);
        isReadChangesSelectedOptionDefault = row.find('.readchanges-action-cell > div.MultiCheckBox > span.selected-text').text().trim().includes(defaultTextDropDownList);

        valuesForCreate = isCreateSelectedOptionDefault ? -1 : getValuesFromDropDown('create', createDropdown.val());
        valuesForRead = isReadSelectedOptionDefault ? -1 : getValuesFromDropDown('read', readDropdown.val());
        valuesForUpdate = isUpdateSelectedOptionDefault ? -1 : getValuesFromDropDown('update', updateDropdown.val());
        valuesForDelete = isDeleteSelectedOptionDefault ? -1 : getValuesFromDropDown('delete', deleteDropdown.val());
        valuesForReadChanges = isReadChangesSelectedOptionDefault ? -1 : getValuesFromDropDown('readchanges', readChangesDropdown.val());
    }
    else {
        valuesForCreate = isCreateSelectedOptionDefault ? 0 : getValuesFromDropDown('create', createDropdown.val());
        valuesForRead = isReadSelectedOptionDefault ? 0 : getValuesFromDropDown('read', readDropdown.val());
        valuesForUpdate = isUpdateSelectedOptionDefault ? 0 : getValuesFromDropDown('update', updateDropdown.val());
        valuesForDelete = isDeleteSelectedOptionDefault ? 0 : getValuesFromDropDown('delete', deleteDropdown.val());
    }

    var postData = {
        'ClaimSetId': claimSetId,
        'ResourceClaimId': resourceId,
        'AuthorizationStrategyForCreate': valuesForCreate,
        'AuthorizationStrategyForRead': valuesForRead,
        'AuthorizationStrategyForUpdate': valuesForUpdate,
        'AuthorizationStrategyForDelete': valuesForDelete
    };

    if(odsVersion === 6) 
        postData['AuthorizationStrategyForReadChanges'] = valuesForReadChanges;

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
            var message = data.responseText;
            if (data.status === 400) {
                message = '';
                var model = JSON.parse(data.responseText)
                if (model.AuthorizationStrategyForCreate.Errors[0]) {
                    message += ` ${model.AuthorizationStrategyForCreate.Errors[0].ErrorMessage} `
                }
                if (model.AuthorizationStrategyForRead.Errors[0]) {
                    message += ` ${model.AuthorizationStrategyForRead.Errors[0].ErrorMessage} `
                }
                if (model.AuthorizationStrategyForUpdate.Errors[0]) {
                    message += ` ${model.AuthorizationStrategyForUpdate.Errors[0].ErrorMessage} `
                }
                if (model.AuthorizationStrategyForDelete.Errors[0]) {
                    message += ` ${model.AuthorizationStrategyForDelete.Errors[0].ErrorMessage} `
                }
                if (model.AuthorizationStrategyForReadChanges.Errors[0]) {
                    message += ` ${model.AuthorizationStrategyForReadChanges.Errors[0].ErrorMessage} `
                }
            }
            ClaimSetToastrMessage("There was an error in overriding strategies on ".concat(resourceName).concat(message == '' ? data.responseText : message));
            
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
    $(".edit-resource-check").show();
    $(".override-auth").hide();
 };
$(function () {
    $(".override-auth").click(overrideAuth);
    $(".reset-auth").click(resetStrategiesToDefault);
    $(".edit-resource-check").click(overrideStrategies);
});
