/*
https://www.codeproject.com/Tips/5162015/Multi-select-Check-Box-List-or-Checkbox-Dropdown-w
*/
$(document).ready(function () {
    $(document).on("click", ".MultiCheckBox", function () {
        var detail = $(this).next();
        detail.show();
    });

    $(document).on("click", ".MultiCheckBoxDetail .cont input", function (e) {
        e.stopPropagation();
        $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();

        if (!$(this).data("default-auth") && $(this).prop("checked")) {
            $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", '');
            $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
        else if ($(this).data("default-auth") && $(this).prop("checked")) {
            $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.standard").prop("checked", '');
            $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", 'checked');
            $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
        else if ($(this).data("default-auth") && !$(this).prop("checked")) {
            $(this).closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", '');
            $(this).closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
    });

    $(document).on("click", ".MultiCheckBoxDetail .cont", function (e) {
        var inp = $(this).find("input");
        var chk = inp.prop("checked");
        inp.prop("checked", !chk);

        var multiCheckBoxDetail = $(this).closest(".MultiCheckBoxDetail");
        multiCheckBoxDetail.next().UpdateSelect();

        if (!inp.data("default-auth") && inp.prop("checked")) {
            inp.closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", '');
            inp.closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
        else if (inp.data("default-auth") && inp.prop("checked")) {
            inp.closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.standard").prop("checked", '');
            inp.closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", 'checked');
            inp.closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
        else if ((inp.data("default-auth") && !inp.prop("checked"))) {
            inp.closest(".MultiCheckBoxDetail").find(".MultiCheckBoxDetailBody input.default-auth").prop("checked", '');
            inp.closest(".MultiCheckBoxDetail").next().UpdateSelect();
        }
    });

    $(document).mouseup(function (e) {
        var container = $(".MultiCheckBoxDetail");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });
});

var defaultMultiCheckBoxOption = { mainWidth: "200px", width: '220px', defaultText: 'Please select a value', height: '200px' };

jQuery.fn.extend({
    CreateMultiCheckBox: function (options) {

        var localOption = {};
        localOption.width = (options != null && options.width != null && options.width != undefined) ? options.width : defaultMultiCheckBoxOption.width;
        localOption.mainWidth = (options != null && options.mainWidth != null && options.mainWidth != undefined) ? options.mainWidth : defaultMultiCheckBoxOption.mainWidth;
        localOption.defaultText = (options != null && options.defaultText != null && options.defaultText != undefined) ? options.defaultText : defaultMultiCheckBoxOption.defaultText;
        localOption.height = (options != null && options.height != null && options.height != undefined) ? options.height : defaultMultiCheckBoxOption.height;
        var widthSelectedText = localOption.mainWidth.split("px")[0] - 30;
        this.hide();
        this.attr("multiple", "multiple");
        var divSel = $("<div class='MultiCheckBox'><span class='selected-text' style='width:" + (widthSelectedText) + "px'>" + localOption.defaultText + "</span><span class='k-icon k-i-arrow-60-down'><svg aria-hidden='true' focusable='false' data-prefix='fas' data-icon='sort-down' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 320 512' class='svg-inline--fa fa-sort-down fa-w-10 fa-2x'><path fill='currentColor' d='M41 288h238c21.4 0 32.1 25.9 17 41L177 448c-9.4 9.4-24.6 9.4-33.9 0L24 329c-15.1-15.1-4.4-41 17-41z' class=''></path></svg></span></div>").insertBefore(this);
        divSel.css({ "width": localOption.mainWidth });

        var detail = $("<div class='MultiCheckBoxDetail'><div class='MultiCheckBoxDetailBody'></div></div>").insertAfter(divSel);
        detail.css({ "width": parseInt(options.width) + 10, "max-height": localOption.height });
        var multiCheckBoxDetailBody = detail.find(".MultiCheckBoxDetailBody");

        function escapeHtml(unsafe) {
            return unsafe
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;")
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#039;");
        }

        this.find("option").each(function () {
            var val = escapeHtml($(this).attr("value") || '');
            var selected = $(this).attr("selected");
            var disabled = $(this).attr("disabled");
            var default_auth = $(this).data("default-auth")

            if (selected == undefined)
                selected = '';

            if (disabled == undefined)
                disabled = '';

            if (default_auth == undefined)
                default_auth = '';

            if (disabled) {
                multiCheckBoxDetailBody.append(`<div class='cont'><input type='checkbox' class='mulinput ${(default_auth ? "default-auth" : "standard")}' value='${val}' ${(selected ? "checked" : "")} ${(disabled ? "disabled='disabled'" : "")} text='${ escapeHtml($(this).text()) }' data-default-auth=${ default_auth } /> ${ escapeHtml($(this).text()) } </div>`);
            }
            else {
                multiCheckBoxDetailBody.append(`<div class='cont'><input type='checkbox' class='mulinput ${(default_auth ? "default-auth" : "standard")}' value='${val}' ${(selected ? "checked" : "")}  text='${escapeHtml($(this).text())}' data-default-auth=${default_auth } /> ${escapeHtml($(this).text())} </div>`);
            }
        });

        multiCheckBoxDetailBody.css("max-height", (parseInt($(".MultiCheckBoxDetail").css("max-height")) - 28) + "px");
    },
    UpdateSelect: function (selectedTextSpan) {
        var arr = [];
        var arrDef = [];
        var text = "";
        var selectedTextSpan = this.prev().prev().find(".selected-text");
        this.prev().find(".mulinput:checked").each(function () {
            if (!$(this).data('default-auth')) {
                arr.push($(this).val());
            }
            else {
                arrDef.push($(this).val());
            }
            text = $(this).attr("text");
        });
        if (arr.length == 0 && arrDef.length == 0) {
            selectedTextSpan.text("Please select values");

        } else if (arr.length > 1) {
            selectedTextSpan.text("Items selected: " + arr.length);
        }
        else if (arrDef.length > 1) {
            selectedTextSpan.text("Items selected: " + arrDef.length);
        }
        else {
            selectedTextSpan.text(text);
        }
        this.val(arr);
    },
});
