import Vue from 'vue/dist/vue.esm'
import VueResources from 'vue-resource'
import Chartist from 'chartist'


Vue.use(VueResources);

Vue.http.headers.common['X-CSRF-Token'] = document.head.querySelector("[name=csrf-token]").content;


const lineChart = Vue.component('line-chart', {
    data: function () {
        return {
            graphProps: {
                labels: [],
                series: []
            }
        }
    },

    props: {
        'dataUri': {
            type: String,
            required: true
        },
        'accountId': {
            type: String,
            required: true
        }
    },

    mounted() {
        const _this = this;
        this.$http.get(this.dataUri).then(response => {
            _this.graphProps.labels = response.body.labels;
            _this.graphProps.series = [response.body.series.map(v => parseFloat(v))];
            new Chartist.Line('#chart-for-account-' + this.accountId, this.graphProps);
        });
    },

    template: '<div :id="\'chart-for-account-\'+ accountId" class="ct-chart"></div>',


});


document.addEventListener('DOMContentLoaded', () => new Vue({
    el: '.charts',
    components: {lineChart}
}));
