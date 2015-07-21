//= require jquery
//= require jquery_ujs
//= require angular/angular
//= require angular-ui-router/release/angular-ui-router
//= require angular-resource/angular-resource
//= require angular-busy/dist/angular-busy
//= require angular-flash-alert/dist/angular-flash
//= require perfect-scrollbar/js/perfect-scrollbar.jquery
//= require ng-sortable/dist/ng-sortable
//= require sweetalert/dist/sweetalert-dev
//= require angular-sweetalert/SweetAlert
//= require moment/moment
//= require angular-moment/angular-moment
//= require moment/locale/zh-cn
//= require plugins/jquery.datetimepicker
//= require work_angular

$(function(){
  $('.p_calendar_container').perfectScrollbar();

  jQuery('.datepicker').datetimepicker({
   lang:'zh',
   timepicker:false,
   format:'Y-m-d',
   closeOnDateSelect: true
  });
});
