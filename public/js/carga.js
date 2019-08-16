var app = new Vue({
    el: '#carga',
    data: {
        isProcessing: false,
        form: {},
        errors: {}
    },
    created: function () {
        Vue.set(this.$data, 'form', _form);
    },

    methods: {
        addLine: function() {
            this.form.products.push({name: '', price: 0, qty: 1});
          },
        remove: function(product) {
        const index =this.form.products.indexOf(detalle);
            this.form.products.splice(index, 1);
        },
        selectCliente(search,loading){
            let me=this;
            loading(true)

            var url= '/admin/customers/selectCliente?filtro='+search;
            this.$http.get(url).then(function (response) {
                let respuesta = response.data;
                q: search
                me.form.arrayCliente=respuesta.clientes;
                loading(false)
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        getDatosCliente(val1){
            let me = this;
            me.loading = true;
            me.form.client_id = val1.id;
        },
        selectRuta(search,loading){
            let me=this;
            loading(true)

            var url= '/admin/address/selectRuta?filtro='+search;
            this.$http.get(url).then(function (response) {
                let respuesta = response.data;
                q: search
                me.form.arrayRuta=respuesta.rutas;
                loading(false)
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        create(){}
    },
});