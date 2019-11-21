import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox.js';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete.js';

initMapbox();
initAutocomplete();

import { initDatepicker } from '../plugins/datepicker';
import "../plugins/flatpickr"

initDatepicker();


import "../plugins/flatpickr"

