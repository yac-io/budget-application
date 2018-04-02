import Vue from 'vue'
import VueResources from 'vue-resource'

Vue.use(VueResources);

Vue.http.headers.common['X-CSRF-Token'] = document.head.querySelector("[name=csrf-token]").content;

const stateChangeCheckbox = Vue.component('state-change-checkbox', {
    data: function () {
        return {checked: false}
    },
    props: {
        'updateUri': {
            type: String,
            required: true
        },
        'startChecked': {
            type: String,
            required: false
        }
    },

    mounted() {
        this.checked = this.startChecked !== undefined && this.startChecked === 'true';
    },

    template: '<label class="mdl-checkbox mdl-js-checkbox mdl-data-table__select" v-on:click="update" for=""><input type="checkbox" class="mdl-checkbox__input" v-model="checked"/></label>',


    methods: {
        update() {
            this.$http.put(this.updateUri).then(response => {
                this.checked = !this.checked;
                if(this.checked) {
                    this.$el.MaterialCheckbox.check();
                } else {
                    this.$el.MaterialCheckbox.uncheck();
                }
            }, error => {

            });
        }
    }


});


document.addEventListener('DOMContentLoaded', () => new Vue({
    el: '#app',
    components: {stateChangeCheckbox}
}));


