import Vue from 'vue/dist/vue.esm'
import VueResources from 'vue-resource'

Vue.use(VueResources);

Vue.http.headers.common['X-CSRF-Token'] = document.head.querySelector("[name=csrf-token]").content;

const stateChangeCheckbox = Vue.component('state-change-checkbox', {
    data: function () {
        return {checked: false,
                disabled: false,
        }
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

    template: '<input type="checkbox" v-model="checked" v-on:change="update" :disabled ="disabled"/>',

    methods: {
        update() {
            this.$data.disabled = true;
            this.$http.put(this.updateUri).then(response => {
                this.$data.disabled = false;
                }, error => {
                this.$data.disabled = false;
                this.$data.checked = !this.$data.checked;
            });
        }
    }


});


document.addEventListener('DOMContentLoaded', () => new Vue({
    el: '#app',
    components: {stateChangeCheckbox}
}));


