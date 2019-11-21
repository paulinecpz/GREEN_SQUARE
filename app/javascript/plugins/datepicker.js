
import daterangepicker from 'daterangepicker';

const initDatepicker = () => {
  console.log('initDatepicker executed')
  $(function() {
    $('#dates_range').daterangepicker({
      opens: 'left'
    }, function(start, end, label) {
      console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    });
  });
}


export { initDatepicker }
