<template>
  <div>
    <AdminLogin v-if="!isLoggedIn" @login-success="LogInSuccess"/>
    <AdminTabs v-else></AdminTabs>
  </div>
</template>

<script>
import AdminLogin from '../components/AdminLogin.vue';
import AdminTabs from '../components/AdminTabs.vue';

export default {
  name: "Home",
  components: {
    AdminLogin,
    AdminTabs
  },
  data(){
    return{
      isLoggedIn:false
    };
  },
  methods: {
    LogInSuccess(){
      this.isLoggedIn=true
    }
  },

};
</script>
