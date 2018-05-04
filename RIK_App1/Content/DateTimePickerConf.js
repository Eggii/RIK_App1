
jQuery.datetimepicker.setLocale('et');

jQuery('#TxtEventDateTime').datetimepicker({
    step: 5,
    format: 'd.m.Y H:i',
    minDate: 0,
    dayOfWeekStart: +1,
    
});