<script setup>
import axios from 'axios';
</script>
<template>
    <h1 class="text-center my-3">Fresh Drink</h1>
    <div class="card-grid">
        <div v-for="item in data" class="card my-2" :key="item.id">
            <div class="card-header d-flex justify-content-between ">
                <h3 style="width:208px ; height:30px ;" class="overflow-hidden">{{ item.nama_food }}</h3>
                <button type="button" class="btn btn-primary" @click="showPopup(item.id_food)">buy</button>
            </div>
            <div class="card-body">
                <div class="card-title">
                   Jenis Minuman: <h2 class=""> {{ item.jenis_fod }}</h2> 
                </div>
                <div class="d-flex justify-content-center mb-2">
                    <img :src="item.gambar" alt="" width="130" height="124" class="">
                </div>
                Deskripsi:
                <p  class="p-3 text-center border">
                    {{ item.deskripsi }}
                </p>
                <h5 class="">
                   Harga: Rp. {{ item.harga }}
                </h5>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalPop" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">{{ mak.nama_food }}</h1>
                    <button type="button" class="btn-close" @click="closeBtn()" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <div>
                        <img :src="mak.gambar" alt="" width="130" height="124" class="">
                    </div>
                    <div class="border">
                        <div>
                            deskripsi: {{ mak.deskripsi }}
                        </div>
                        <div>
                            Harga: Rp. {{ mak.harga }}
                        </div>
                    </div>
                </div>
                <hr>
                <div class="mx-3">
                    Note: <input type="text" v-model="note" class="mx-3" style="width: 350px;">
                </div>
                <div class="mx-3 my-3 d-flex flex-direction-row justify-content-center">
                    <button class="like-button px-2" @click="decrement()">-</button>
                    <input type="number" v-model="jumlah" class="mx-3 text-center">
                    <button class="like-button px-2" @click="increment()">+</button>
                </div>

                <div class="modal-footer d-flex justify-content-around">
                    <button type="button" class="btn btn-secondary" @click="closeBtn()"
                        data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" @click="buying()">Masukan Keranjang</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

export default {
    name: 'drink',
    data() {
        return {
            data: [],
            mak: [],
            buys: [],
            cart: [],
            selectedMakanan: '',
            note: '',
            jumlah: 0,
            // Property to store fetched data
        };
    },
    mounted() {
        this.fetchData();
        this.myModal = new bootstrap.Modal(document.getElementById('modalPop')); // Initialize myModal
    },
    methods: {
        fetchData() {
            axios.get('http://localhost:8000/api/minuman')
                .then(response => {
                    this.data = response.data;
                    console.log(response.data);
                })
                .catch(error => {
                    console.error(error);
                });
        },

        showPopup(id_food) {
            this.selectedMakanan = id_food;
            //     // Optionally, open a popup component or display details inline
            this.myModal.show();
            this.fetchSelect();
        },
        closeBtn() {
            this.myModal.hide();
        },
        fetchSelect() {
            console.log(this.selectedMakanan);
            axios.get('http://localhost:8000/api/minuman/' + this.selectedMakanan)
                .then(response => {
                    this.mak = response.data;
                    console.log(response.data);
                })
                .catch(error => {
                    console.error(error);
                });
        },
        buying() {
            this.buys = {
                id_food: this.mak.id_food,
                note: this.note,
                jumlah: this.jumlah
            };
            console.log(this.buys);

            axios.post('http://localhost:8000/api/cart/', this.buys)
                .then(response => {
                    // Handle successful response
                    console.log('Data sent successfully!');
                    console.log(response);
                    this.myModal.hide();
                    window.location.reload();
                    // Provide feedback to the user (e.g., show a success message)
                })
                .catch(error => {
                    // Handle API error
                    console.error('API error:', error);
                    // Display an error message to the user
                });
        },
        increment() {
            this.jumlah++;
            console.log(this.jumlah);
        },
        decrement() {
            this.jumlah = Math.max(0, this.jumlah - 1); // Prevent negatives
        },
    }
};
</script>

<style scoped>
.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    /* Adjust card width */
    overflow-x: auto;
    /* Enable horizontal scrolling */
}

/* Optional card spacing */
.card {
    margin-right: 10px;
}
</style>
