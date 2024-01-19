
<script setup>
import Heading from './Header.vue';
import Item from '../components/WelcomeItem.vue';
import axios from 'axios';



</script>

<template>
  <div class="px-5 pb-5">

    <Heading />
    <div class="row align-items-start">
      <div class="col-lg-9 col-md-6">
        <div class="text-center ">
          <button @click="showCoffee" class="mx-5 mx-lg-5 px-lg-5 px-5 mx-md-2 px-md-2">Drink</button>
          <button @click="showFood" class="mx-5 mx-lg-5 px-lg-5 px-5 mx-md-2 px-md-2">Food</button>

        </div>
        <component :is="currentComponent" />
      </div>
      <div class="col-md-6 col-lg-3">
        <div class="card ">
          <h3 class="card-header text-center">
            Keranjang
          </h3>
          <div class="card-body ">
            <div v-for="carts in cart.value" class="card border-0 " :key="carts.id_cart">
              <div class=" ">
                <hr>

                <div class="d-flex justify-content-between">
                  <button class="btn btn-danger" @click="deleted(carts.id_cart)">
                    delete
                  </button>
                  <button class="btn btn-success" @click="showEdit(carts.id_cart)">
                    Update
                  </button>
                </div>
                <h3 class="text-center">{{ carts.food.nama_food }}</h3>
              </div>

              <div class="card-body">

                <div class="d-flex justify-content-center">
                  <img :src="carts.food.gambar" alt="" width="130" height="124" class="">
                </div>
                <div class="card-title border p-2">
                  little note: {{ carts.note }}
                </div>
                <div class="d-flex justify-content-between">
                  <p>
                    harga: Rp. {{ carts.food.harga }}
                  </p>
                  <p>
                    Jumlah: {{ carts.jumlah }}
                  </p>
                </div>

              </div>
              <hr>
            </div>
          </div>
          <h4 class=" text-center">
            Total: {{ total.value }}
          </h4>
          <button class="text-center btn btn-primary" @click="payment()">Pay</button>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" v-if="carter">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel" v-if="carter.food">{{ carter.food.nama_food }}</h1>
            <button type="button" class="btn-close" @click="closeBtn()" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <div class="modal-body text-center">
            <div>
              <img v-if="carter.food" :src="carter.food.gambar" alt="" width="130" height="124" class="">
            </div>
            <div class="border">

              <div class="d-flex justify-content-between">
                <p v-if="carter.food">
                  harga: Rp. {{ carter.food.harga }}
                </p>
                <p v-if="carter">
                  Jumlah: {{ carter.jumlah }}
                </p>
              </div>
            </div>
          </div>
          <hr>
          <div class="mx-3">
            Note: <input type="text" v-model="carter.note" class="mx-3" style="width: 350px;">
          </div>
          <div class="mx-3 my-3 d-flex flex-direction-row justify-content-center">
            <button class="like-button px-2" @click=" this.carter.jumlah = Math.max(1, this.carter.jumlah - 1)">-</button>
            <input type="number" v-model="carter.jumlah" class="mx-3 text-center">
            <button class="like-button px-2" @click="this.carter.jumlah++">+</button>
          </div>

          <div class="modal-footer d-flex justify-content-around">
            <button type="button" class="btn btn-secondary" @click="closeBtn()" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" v-if="carter" @click="updating(carter.id_cart)">Update</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalPay" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel" v-if="cart"> Payment Shoping</h1>
            <button type="button" class="btn-close" @click="closeBtn()" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <h3 class="modal-body text-center">
            Total Belanja: Rp. {{ total.value }}
            <br>
            Total Produk: {{ hitungProduk }}
          </h3>
          <hr>
          <h3 class="text-center">Choose Your Payment Method</h3>
          <div class="d-flex justify-content-between m-3">
            <img style="cursor: pointer;" src="https://img.freepik.com/premium-vector/rupiah-money-paper-coin-bundle_696497-260.jpg?w=826"
              width="150px" alt="">
            <img width="150px" style="cursor: pointer;"
              src="https://img.freepik.com/premium-vector/illustration-vector-presentation-about-credit-card-payment-mobile-phone-machine-reader_325203-184.jpg?w=1060"
              alt="">
            <img width="150px" style="cursor: pointer;"
              src="https://img.freepik.com/free-vector/plain-credit-card-concept-illustration_114360-199.jpg?w=826&t=st=1705704594~exp=1705705194~hmac=6ec0370cbea6d94286625cd78d879520fc9a3b3e77b66d6edf7e4bf62408e702"
              alt="">
          </div>

          <div class="modal-footer d-flex justify-content-around">
            <button type="button" class="btn btn-secondary" @click="closeBtn()" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
  </div>
  <div>
      <h1 class="d-flex justify-content-center  mb-0 p-5 badge text-bg-dark" style="border-radius:none;">
        © 2024 Dyah Kusuma. All Rights Reserved.
      </h1>
    </div>
</template>

<script>
import { ref } from 'vue';
import Item from '../components/WelcomeItem.vue';
import Items from '../components/TheWelcome.vue';

export default {
  components: {
    Item,
    Items,
  }, data() {
    return {
      currentComponent: 'Items',
      cart: ref([]),
      total: ref([]),
      carter: [],
      hitungProduk:[],
    };
  }, mounted() {
    this.cartData();
    this.myModal = new bootstrap.Modal(document.getElementById('modalEdit')); // Initialize myModal
    this.myModals = new bootstrap.Modal(document.getElementById('modalPay')); // Initialize myModal
  },
  methods: {
    showCoffee() {
      this.currentComponent = 'Item';
    },
    showFood() {
      this.currentComponent = 'Items';
    },
    cartData() {
      axios.get('http://localhost:8000/api/cart')
        .then(response => {
          this.cart.value = response.data;
          // Calculate total price
          this.total.value = this.cart.value.reduce((acc, item) => {
            return acc + item.jumlah * item.food.harga;
          }, 0);
          this.hitungProduk = this.cart.value.length;
          console.log(this.hitungProduk)
        })
        .catch(error => {
          console.error(error);
        });
    }, updating(id_cart) {
      const databaru = {
        jumlah: this.carter.jumlah,
        note: this.carter.note
      }
      axios.patch('http://localhost:8000/api/cart/' + id_cart, databaru)
        .then(response => {
          console.log(response.data);
          window.location.reload();
        })
        .catch(error => {
          console.error(error);
        });
    },
    deleted(id_cart) {
      axios.delete('http://localhost:8000/api/cart/' + id_cart)
        .then(response => {
          console.log(response.data);
          window.location.reload();
        })
        .catch(error => {
          console.error(error);
        });
    },
    showEdit(id_cart) {
      //     // Optionally, open a popup component or display details inline
      this.myModal.show();
      axios.get('http://localhost:8000/api/cart/' + id_cart)
        .then(response => {
          this.carter = response.data;
          console.log(response.data);
        })
        .catch(error => {
          console.error(error);
        });
    },
    payment() {
      this.myModals.show();

    },
  },
  watch: {
    otherDataThatMightChange(newValue) {
      this.cart.value = newValue;
    },
  },
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
}</style>