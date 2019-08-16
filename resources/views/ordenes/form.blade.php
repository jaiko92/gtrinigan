<div class="row">
    <div class="col-sm-6">
        <div class="form-group">
            <label for="">Cliente(*)</label>
            <v-select
                :filterable="false"
                 v-model="form.client"
                @search="selectCliente"
                label="nombre"
                :options="form.arrayCliente"
                placeholder="Buscar Cliente..."
                :change="getDatosCliente(form.client)"                                       
            >
            <template slot="option" slot-scope="option">
                             @{{option.razon_social}}
                <span>@{{option.documento}}</span>
            </template>
            <template slot="selected-option" slot-scope="option">
                <div class="selected d-center">
                     @{{option.razon_social}}
                </div>
            </template>
            </v-select>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Precio del Envio</label>
                    <input type="text" class="form-control" v-model="form.precio_envio">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>Anticipo</label>
                    <input type="text" class="form-control" v-model="form.anticipo">
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
         <label for="">Ruta(*)</label>
            <v-select
                :filterable="false"
                @search="selectRuta"
                label="nombre"
                :options="form.arrayRuta"
                placeholder="seleccione la ruta..."
                v-model="form.ruta"                                        
            >
            <template slot="option" slot-scope="option">
                             @{{option.origen}} -
                <span>@{{option.destino}}</span>
            </template>
            <template slot="selected-option" slot-scope="option">
                <div class="selected d-center">
                     @{{option.origen}}  -
                     @{{option.destino}}
                </div>
            </template>
            </v-select>
        </div>
        <div class="form-group">
            <label>Cantidad de Animal</label>
            <input type="text" class="form-control" v-model="form.cantidad_reses">
        </div>
    </div>
</div>
<hr>
<div v-if="errors.products_empty">
    <p class="alert alert-danger">@{{errors.products_empty[0]}}</p>
    <hr>
</div>
<table class="table table-bordered table-form">
    <thead>
        <tr>
            <th>Tipo tratamiento</th>
            <th>Cantidad</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="(product, index) in form.products">
            <td class="table-name" :class="{'table-error': errors['products.' + index + '.descripcion']}">
                <textarea class="table-control" v-model="product.descripcion"></textarea>
            </td>
            <td class="table-qty" :class="{'table-error': errors['products.' + index + '.cantidad']}">
                <input type="text" class="table-control" v-model="product.cantidad">
            </td>
            <td class="table-remove">
                <span @click="remove(product)" class="table-remove-btn">&times;</span>
            </td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td class="table-empty" colspan="2">
                <span @click="addLine" class="table-add_line">Agregar linea</span>
            </td>
        </tr>
    </tfoot>
</table>