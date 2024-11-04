<template>
  <div>
    <v-card>
      <v-tabs v-model="choosenTab">
        <v-tab>Bank Master Management</v-tab>
        <v-tab>Config Charges</v-tab>
        <v-tab>User Management Screen</v-tab>
      </v-tabs>
    </v-card>
    <div v-if="choosenTab==0"><BankMasterManagement/></div>
    <div v-if="choosenTab==1"><ConfigCharges/></div>
    <div v-if="choosenTab==2"><UserManagementScreen/></div>
  </div>
</template>

<script>
import BankMasterManagement from "./BankMasterManagement.vue";
import ConfigCharges from "./ConfigCharges.vue";
import UserManagementScreen from "./UserManagementScreen.vue";
export default {
  data(){
    return{
        choosenTab:0
    }
  },
  components: {
    BankMasterManagement,
    ConfigCharges,
    UserManagementScreen,
  },
};
</script>