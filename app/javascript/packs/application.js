import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox.js';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initDatepicker } from '../plugins/datepickers.js';
import { initAutocomplete } from '../plugins/init_autocomplete.js';
// import { initDatepicker } from '../plugins/datepicker';

initMapbox();
initAutocomplete();
initDatepicker();








