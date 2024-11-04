<template>
    <v-container>
    <v-form ref="form">
    <v-row justify="center">
      <v-col cols="12" sm="6" md="6"  >
        <v-select v-model="chargeType" :items="chargeTypes" label="Charge Type"></v-select>
      </v-col>
      <v-col cols="12" sm="6" md="6" >
        <v-text-field v-model="chargePercentage" label="Charge Percentage" type="number"></v-text-field> 
      </v-col>
      <v-col cols="12" sm="4" md="4" >
        <v-menu ref="menu" v-model="menu" :close-on-content-click="false" :return-value.sync="date"
          transition="scale-transition" offset-y min-width="auto">
          <template v-slot:activator="{ on, attrs }">
            <v-text-field v-model="date" label="Effective Date" prepend-icon="mdi-calendar" readonly
              v-bind="attrs" v-on="on"></v-text-field>
          </template>
          <v-date-picker v-model="date" no-title scrollable>
            <v-spacer></v-spacer>
            <v-btn text color="primary" @click="menu = false">
              Cancel
            </v-btn>
            <v-btn text color="primary" @click="$refs.menu.save(date)">
              OK
            </v-btn>
          </v-date-picker>
        </v-menu>       
      </v-col>
    </v-row>
    <v-row justify="space-around">
      <v-col cols="auto" >
        <v-btn @click="addUpdateCharge" color="primary">Add/Update Charge</v-btn>
      </v-col>
    </v-row>
    </v-form>
</v-container>
  </template>
  
  <script>
  export default {
    data() {
      return {
        chargeType: '',
        chargePercentage: '',
        effectiveDate: '',
        chargeTypes: ['STT', 'Brokerage', 'Demat'],
        date: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
        menu: false,
        modal: false,
        menu2: false,
      };
    },
    methods: {
      addUpdateCharge() {
        // Implement logic to add or update charge
      }
    }
  };
  </script>