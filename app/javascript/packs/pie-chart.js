import Vue from 'vue/dist/vue.esm'
import VueResources from 'vue-resource'
import Chartist from 'chartist'


Vue.use(VueResources);

Vue.http.headers.common['X-CSRF-Token'] = document.head.querySelector("[name=csrf-token]").content;

const pieChart = Vue.component('pie-chart', {
    props: {
        'labels': {
            type: Array,
            required: true
        },
        'series': {
            type: Array,
            required: true
        },
        'title': {
            type: String,
            required: true
        }
    },

    mounted() {
        const _this = this;
        const graphData = {
            labels: this.labels,
            series: this.series
        };

        const graphOptions = {
            labelInterpolationFnc: function (label, index) {
                const amount = _this.series[index];
                const total = _this.series.reduce((a, b) => parseFloat(a) + parseFloat(b));
                const percent = Math.round(amount / total * 100);
                return label + ' (' + percent + '%)';
            }
        };


        new Chartist.Pie('#' + this.title, graphData, graphOptions);

    },

    template: '<div :id="title" class="ct-chart"></div>',


});


document.addEventListener('DOMContentLoaded', () => new Vue({
    el: '.pie-chart',
    components: {pieChart}
}));
