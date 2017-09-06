String.prototype.format = function () {
    var args = arguments;
    return this.replace(/\{(\d+)\}/g, function (s, i) {
        return args[i];
    });
}

function clearTable(){
    $("#course_table tr").slice(1).each(function(){
        $("td",this).slice(1).each(function(){
            $(this).text("");
        })
    })
}


function writeTable(data) {
    clearTable();
    var week=parseInt($("#week").val());
    data.forEach(function (json_course) {
        var course = JSON.parse(json_course);
        course["course_time_location"].forEach(function (time_location) {
            if (!time_location || !time_location["weeks"].includes(week)) return;
            for (let i = parseInt(time_location["start_time"]); i <= parseInt(time_location["end_time"]); i++) {
                let selector = "#course_table tr:eq({0}) td:eq({1})".format(i, time_location["weekday"]);
                $(selector).append(constructCourse(course,time_location));
            }
        }
        )
    });
}

function requireCourseTable() {
    var username = $("#username").val();
    var password = $("#password").val();

    var url = "/course_table";
    var data = { "username": username, "password": password };

    $.post(url, data, writeTable, "json"); //data is a form
}

function constructCourse(course,time_location){
    var element = $("<a></a>",{
        text:course["name"], 
        rel:"popover", 
    });
    var pop_content = "{0}<br/>老师：{1}<br/>地点：{2}".format(course["name"],course["teachers"],time_location["location"]);
    element.attr("data-content",pop_content);
    element.attr("tabindex","0");
    element.attr("data-trigger","focus");
    element.attr("data-html","true");
    element.attr("onclick","$(this).popover();");
    element.attr("class","btn btn-default btn-block");
    return element;
}
