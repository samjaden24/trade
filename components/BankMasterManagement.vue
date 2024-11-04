<template>
  <div>
    <v-container fluid class="light-blue lighten-4" style="height: 100vh">
      <v-row justify="center" align="center" style="height: 100%">
        <v-col cols="12" sm="10" md="8" lg="6">
          <v-row>
            <v-col cols="12" sm="4" md="4">
              <v-text-field v-model="bname" label="Bank Name"></v-text-field>
            </v-col>

            <v-col cols="12" sm="4" md="4">
              <v-text-field v-model="brname" label="Branch Name"></v-text-field>
            </v-col>

            <v-col cols="12" sm="4" md="4">
              <v-text-field v-model="ifsccode" label="IFSC Code"></v-text-field>
            </v-col>

            <v-col cols="12">
              <v-textarea autocomplete="Address" v-model="address" label="Address"></v-textarea>
            </v-col>
          </v-row>

          <v-row>
            <v-col>
              <v-btn depressed color="primary" @click="submitBank">Add Bank</v-btn>
            </v-col>
          </v-row>

          <v-row>
            <v-col>
              <h3>Bank List</h3>
              <BankTable :banks="bankList" @edit="editBank" @delete="deleteBank" />
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import BankTable from './BankTable.vue';

export default {
  components: {
    BankTable,
  },
  data() {
    return {
      bname: "",
      brname: "",
      ifsccode: "",
      address: "",
      editingIndex: -1,
    };
  },
  computed: {
    ...mapGetters(['bankList']),
  },
  methods: {
    ...mapActions(['addBank', 'updateBank', 'deleteBank']),
    
    submitBank() {
      if (!this.bname || !this.brname || !this.ifsccode || !this.address) {
        alert("Please fill in all fields.");
        return;
      }
      if (this.editingIndex === -1) {
        this.addBank({
          bname: this.bname,
          brname: this.brname,
          ifsccode: this.ifsccode,
          address: this.address,
        });
      } else {
        this.updateBank({ index: this.editingIndex, bank: {
          bname: this.bname,
          brname: this.brname,
          ifsccode: this.ifsccode,
          address: this.address,
        }});
      }
      this.clearForm();
    },

    editBank(index) {
      const bank = this.bankList[index];
      this.bname = bank.bname;
      this.brname = bank.brname;
      this.ifsccode = bank.ifsccode;
      this.address = bank.address;
      this.editingIndex = index;
    },

    deleteBank(index) {
      if (confirm("Are you sure you want to delete this bank?")) {
        this.$store.dispatch('deleteBank', index); // This calls the Vuex action
      }
    },

    clearForm() {
      this.bname = "";
      this.brname = "";
      this.ifsccode = "";
      this.address = "";
      this.editingIndex = -1;
    },
  },
};
</script>
