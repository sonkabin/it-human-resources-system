var baseUrl = 'http://localhost:8080'

/*
格式化显示LocalDateTime
 */
function LocalDateTimeFormatter(value) {
    return value.replace('T', ' ')
}

/*
比较日期之间的大小
日期格式为yyyy-MM-dd
 */
function DateCompare(date1, date2) {
    var vars1 = date1.split('-')
    var vars2 = date2.split('-')
    var value = 0
    value += (vars1[0] - vars2[0]) * 365
    value += (vars1[1] - vars2[1]) * 30
    value += vars1[2] - vars2[2]
    return value
}

function LocalDateObject(date) {
    var vars = date.split('T')
    var dateObject = {}
    var data = vars[0].split('-')
    dateObject.year = data[0]
    dateObject.month = data[1]
    dateObject.day = data[2]
    return dateObject
}
