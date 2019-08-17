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
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Vehiculo</th>
            <th>Chofer</th>
            <th>Capacidad</th>
            <th>Cantidad</th>
            <th>Observ.</th>
            <th>Precio</th>
            <th>SubTotal</th>
            <th>Anticipo</th>
            <th>Comision</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="(product, index) in form.products">
            <td>
                <v-select
                :filterable="false"
                @search="selectVehicle"
                label="nombre"
                :options="form.arrayVehicle"
                placeholder="seleccione..."
                @input="getDatosVehicle(index, $event)"                                       
                >
                <template slot="option" slot-scope="option">
                    <span>@{{option.placa}}</span>
                </template>
                <template slot="selected-option" slot-scope="option">
                    <div class="selected d-center">
                       @{{option.placa}}
                    </div>
                </template>
                </v-select>
            </td>
             <td>
                <v-select
                :filterable="false"
                @search="selectChofer"
                label="nombre"
                :options="form.arrayChoferes"
                placeholder="seleccione..."
                @input="getDatosChofer(index, $event)"                                       
                >
                <template slot="option" slot-scope="option">
                            @{{option.nombres}} -
                <span>@{{option.apellidos}}</span>
                </template>
                <template slot="selected-option" slot-scope="option">
                    <div class="selected d-center">
                       @{{option.nombres}}
                    </div>
                </template>
                </v-select>
            </td>
             <td>
                <span>@{{product.capacidad}}</span>
            </td>
            <td>
                <input type="text" class="form-control" v-model="product.cantidad">
            </td>
            <td>
               <textarea class="form-control" v-model="product.observacion"></textarea>
            </td>
            <td>
                <input type="text" class="form-control" v-model="product.precio">
            </td>
            <td>
                <span>@{{product.capacidad * product.precio}}</span>
            </td>
            <td>
                <input type="text" class="form-control" v-model="product.anticipo">
            </td>
             <td>
                <input type="text" class="form-control" v-model="product.comision">
            </td>
             <td>
                <span>@{{ ((product.capacidad * product.precio) - product.anticipo) - product.comision}}</span>
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