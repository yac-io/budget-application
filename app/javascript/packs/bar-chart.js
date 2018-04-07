import Vue from 'vue/dist/vue.esm'
import VueResources from 'vue-resource'
import Chartist from 'chartist'
import ChartistPluginsLegend from 'chartist-plugin-legend'


Vue.use(VueResources);

Vue.http.headers.common['X-CSRF-Token'] = document.head.querySelector("[name=csrf-token]").content;

const barChart = Vue.component('bar-chart', {
    props: {
        'labels': {
            type: Array,
            required: true
        },
        'serie1': {
            type: Array,
            required: true
        },
        'name1': {
            type: String,
            required: false
        },
        'className1': {
            type: String,
            required: true
        },
        'serie2': {
            type: Array,
            required: false
        },
        'name2': {
            type: String,
            required: false
        },
        'className2': {
            type: String,
            required: false
        }
    },

    mounted() {
        const _this = this;
        const graphData = {
            labels: this.labels,
            series: [
                {
                    className: this.className1,
                    name: this.name1,
                    data: this.serie1
                },
                {
                    className: this.className2,
                    name: this.name2,
                    data: this.serie2
                }
            ]
        };

        let graphOptions = {
            seriesBarDistance: 10,
            plugins: [
                ChartistPluginsLegend({
                    classNames: [_this.className1, _this.className2]
                })
            ]
        };

        new Chartist.Bar('#bar-chart', graphData, graphOptions);

    },

    template: '<div id="bar-chart" class="ct-chart"></div>',


});


document.addEventListener('DOMContentLoaded', () => new Vue({
    el: '.chart',
    components: {barChart}
}));
