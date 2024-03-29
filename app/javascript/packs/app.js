/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import ujs from "@rails/ujs"
import "jquery"

import Chartkick from "chartkick";
window.Chartkick = Chartkick;
import 'popper.js'
import 'bootstrap/dist/js/bootstrap.min'
import Chart from "chart.js";
Chartkick.addAdapter(Chart);
ujs.start();

/*document.addEventListener('turbolinks:load', function () {
    componentHandler.upgradeDom();
});*/