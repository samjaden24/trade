<template>
    <div class="blue-background fill-height">
      <v-container>
        <v-card class="white--text" elevation="3">
          <v-card-text>
            <v-row justify="center">
              <v-col class="d-flex" cols="12" sm="3" md="3">
                <v-select 
                  label="Stock Name" 
                  v-model="selectedStock" 
                  :items="stockOptions" 
                  @change="populateStockDetails"
                ></v-select>
              </v-col>
            </v-row>
  
            <v-row justify="space-around">
              <v-col cols="12" sm="3" md="3">
                <label>Segment:</label>
                <v-text-field v-model="segment" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>ISIN:</label>
                <v-text-field v-model="isin" readonly></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Current Price:</label>
                <v-text-field v-model="currentPrice" readonly></v-text-field>
              </v-col>
            </v-row>
  
            <v-row justify="space-around">
              <v-col cols="12" sm="3" md="3">
                <label>Quantity:</label>
                <v-text-field type="number" v-model="quantity" @input="calculateTotal"></v-text-field>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Trade Type:</label>
                <v-radio-group v-model="tradeType">
                  <v-radio label="Sell" color="red" value="Sell"></v-radio>
                  <v-radio label="Buy" color="success" value="Buy"></v-radio>
                </v-radio-group>
              </v-col>
              <v-col cols="12" sm="3" md="3">
                <label>Estimated Total:</label>
                <v-text-field v-model="estimatedTotal" readonly></v-text-field>
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
    data() {
      return {
        selectedStock: null,
        segment: '',
        isin: '',
        currentPrice: 0,
        quantity: 0,
        tradeType: 'Buy',
        estimatedTotal: 0,
        stocks: [
          {
            stockName: "Tech Innovations",
            segment: "Technology",
            isin: "US1234567890",
            currentPrice: 123.5,
          },
          {
            stockName: "Green Energy Corp",
            segment: "Energy",
            isin: "US2345678901",
            currentPrice: 64.6,
          },
          {
            stockName: "Health Plus Inc.",
            segment: "Healthcare",
            isin: "US3456789012",
            currentPrice: 37.0,
          },
          {
            stockName: "Global Finance",
            segment: "Finance",
            isin: "US4567890123",
            currentPrice: 83.6,
          },
          {
            stockName: "Retail Giants",
            segment: "Consumer Goods",
            isin: "US5678901234",
            currentPrice: 69.0,
          },
          {
            stockName: "Eco Materials Ltd",
            segment: "Materials",
            isin: "US6789012345",
            currentPrice: 52.5,
          },
        ],
      };
    },
    computed: {
      stockOptions() {
        const options = [];
        for (const stock of this.stocks) {
          options.push(stock.stockName);
        }
        return options;
      },
    },
    methods: {
      populateStockDetails() {
        for (const stock of this.stocks) {
          if (stock.stockName === this.selectedStock) {
            this.segment = stock.segment;
            this.isin = stock.isin;
            this.currentPrice = stock.currentPrice;
            this.calculateTotal(); // Update estimated total when stock details are populated
            break; // Exit loop after finding the selected stock
          }
        }
      },
      calculateTotal() {
        this.estimatedTotal = this.quantity * this.currentPrice;
      },
    },
  };
  </script>
  
  
  
  <style scoped>
.fill-height {
  min-height: 100vh;
}

.blue-background {
  background-color: #2196f3;
  padding: 24px;
}

.v-card-text label {
  color: #ffffff; /* White text for labels inside the card */
}

.primary {
  background-color: #ffffff; /* White background for button */
  color: #1565c0; /* Blue text color for the button */
}
</style>
  