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
            this.form.products.push({vehiculo_id: '', vehiculo: '', chofer_id:'', chofer:'', capacidad: 0, cantidad: 1, observacion: '', precio: 0, anticipo: 0, comision: 0});
              vehiculo_id: '',
                vehiculo: '',
                chofer_id: '',
                chofer:'',
                capacidad: 0,
                cantidad: 1,
                observacion: '',
                precio: 0,
                anticipo: 0,
                comision: 0
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
        selectVehicle(search,loading){
            let me=this;
            loading(true)

            var url= '/admin/vehicles/selectvehicle?filtro='+search;
            this.$http.get(url).then(function (response) {
                let respuesta = response.data;
                q: search
                me.form.arrayVehicle=respuesta.vehiculos;
                loading(false)
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        getDatosVehicle(index, e){
            let me = this;
            me.loading = true;
           Vue.set(this.form.products[index], 'vehiculo', e.placa)
           Vue.set(this.form.products[index], 'vehiculo_id', e.id)
           Vue.set(this.form.products[index], 'capacidad', e.capacidad)

        },
        selectChofer(search,loading){
            let me=this;
            loading(true)

            var url= '/admin/choferes/selectchofer?filtro='+search;
            this.$http.get(url).then(function (response) {
                let respuesta = response.data;
                q: search
                me.form.arrayChoferes=respuesta.choferes;
                loading(false)
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        getDatosChofer(index, e){
            let me = this;
            me.loading = true;
           Vue.set(this.form.products[index], 'chofer', e.nombres)
           Vue.set(this.form.products[index], 'chofer_id', e.id)
        },
        create(){}
    },
});