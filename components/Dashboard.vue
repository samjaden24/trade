<template>
    <div class="blue-background fill-height">
      <v-container>
        <v-card class="white--text" elevation="3">
          <v-card-text>
            <h2>1. Profile Overview:</h2>
            <v-row>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="First Name" placeholder="Enter your First Name" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Email" placeholder="Enter your Email" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Phone Number" placeholder="Enter your Phone Number" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="PAN Card Number" placeholder="Enter your PAN Number" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Nominee Name" placeholder="Enter the Nominee Name" readonly></v-text-field>
              </v-col>
            </v-row>
            
            <h2>2. Bank Details:</h2>
            <v-row>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Bank Name" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Branch Name" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="IFSC Code" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <v-text-field label="Bank Account Number" readonly></v-text-field>
              </v-col>
            </v-row>
            
            <h2>3. Subscribed Segments:</h2>
            <v-row>
              <v-col cols="12" sm="4" md="4">
                <v-checkbox label="NSE" color="indigo darken-3"></v-checkbox>
              </v-col>
              <v-col cols="12" sm="4" md="4">
                <v-checkbox label="BSE" color="indigo darken-3"></v-checkbox>
              </v-col>
              <v-col cols="12" sm="4" md="4">
                <v-checkbox label="MCX" color="indigo darken-3"></v-checkbox>
              </v-col>
            </v-row>
            
            <h2>4. Recent Trades</h2>
            <v-data-table></v-data-table>
          </v-card-text>
        </v-card>
      </v-container>
    </div>
  </template>
  
  <script>
  export default {
    // Your component logic here
  };
  </script>
  
  <style scoped>
  .fill-height {
    min-height: 100vh;
  }
  
  .blue-background {
    background-color: #2196F3;
    padding: 24px;
  }
  
  .v-card {
    padding: 16px;
     /* Darker blue for the card background */
  }
  </style>