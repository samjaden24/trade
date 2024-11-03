<template>
    <div class="blue-background fill-height">
      <v-container>
        <v-card class="white--text" elevation="3">
          <v-card-text>
            <v-row justify="center">
              <v-col class="d-flex" cols="12" sm="3" md="3">
                <v-select label="Stock Name"></v-select>
              </v-col>
            </v-row>
  
            <v-row justify="space-around">
              <v-col cols="12" sm="3" md="3">
                <label>Segment:</label>
                <v-text-field readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>ISIN:</label>
                <v-text-field readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Current Price:</label>
                <v-text-field readonly></v-text-field>
              </v-col>
            </v-row>
  
            <v-row justify="space-around">
              <v-col cols="12" sm="3" md="3">
                <label>Quantity:</label>
                <v-text-field type="number"></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Trade Type:</label>
                <v-radio-group>
                  <v-radio label="Sell" color="red" value="Sell"></v-radio>
                  <v-radio label="Buy" color="success" value="Buy"></v-radio>
                </v-radio-group>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Estimated Total:</label>
                <v-text-field readonly></v-text-field>
              </v-col>
            </v-row>
  
            <v-row justify="center">
              <v-col cols="auto">
                <v-btn class="primary">Submit Trade</v-btn>
              </v-col>
            </v-row>
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
  
  .v-card-text label {
    color: #ffffff; /* White text for labels inside the card */
  }
  
  .primary {
    background-color: #ffffff; /* White background for button */
    color: #1565C0; /* Blue text color for the button */
  }
  </style>
  