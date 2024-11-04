<template>
    <div>
     <v-tabs v-model="chosenTab">
        <v-tab>Dashboard</v-tab>
        <v-tab>Trade</v-tab>
     </v-tabs>
      <v-alert type="warning" color="amber darken-2" text prominent>
        KYC Status: Pending
      </v-alert>
   
     <div v-if="chosenTab===0">
        <Dashboard></Dashboard>
     </div>
      <div v-if="chosenTab===1">
        <TradeExecution></TradeExecution>
      </div>
    </div>
  </template>
  
  <script>
  import Dashboard from './Dashboard.vue';
  import TradeExecution from './TradeExecution.vue';
  export default{
    components:{  
      Dashboard,TradeExecution
    },
    data(){
        return{
            chosenTab:0,
        }
    }
  }
  
  </script>