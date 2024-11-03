<template>
    <v-app>
      <v-container fluid class="blue-background fill-height">
        <v-row no-gutters>
          <!-- Left Side (Welcome Message) -->
          <v-col cols="12" md="6" class="d-flex align-center justify-center white--text">
            <div class="text-center">
              <h1>{{ isLogin ? 'Welcome!' : 'Already a User?' }}</h1>
              <h2>{{ isLogin ? '"The biggest risk is not taking a risk"' : '"Welcome back! We missed you"' }}</h2>
              <p>{{ isLogin ? 'Create your account. For Free!' : 'Sign in to continue' }}</p>
              <v-btn color="white" class="blue--text" @click="toggleForm">
                {{ isLogin ? 'Sign Up' : 'Sign In' }}
              </v-btn>
            </div>
          </v-col>
  
          <!-- Right Side (Sign In or Sign Up Card) -->
          <v-col cols="12" md="6" class="d-flex align-center justify-center">
            <!-- Conditionally render SignIn or SignUp based on isLogin value -->
            <SignIn v-if="isLogin" />
            <Signup v-else />
          </v-col>
        </v-row>
      </v-container>
    </v-app>
  </template>
  
  <script>
  import SignIn from './SignIn.vue';
  import Signup from './Signup.vue';
  
  export default {
    components: {
      SignIn,
      Signup,
    },
    data() {
      return {
        isLogin: true,
        email: '',
        password: '',
        confirmPassword: ''
      };
    },
    methods: {
      toggleForm() {
        this.isLogin = !this.isLogin;
      },
      submit() {
        if (this.isLogin) {
          // Handle login
          console.log('Logging in with', this.email, this.password);
        } else {
          // Handle sign up
          console.log('Signing up with', this.email, this.password, this.confirmPassword);
        }
      },
    }
  };
  </script>
  
  <style scoped>
  .fill-height {
    min-height: 100vh; /* Use min-height to allow the container to expand */
  }
  .blue-background {
    background-color: #2196F3; /* Use Vuetify's default blue color */
    /* Add transition if needed for a smooth background change */
    transition: background-color 0.3s ease;
  }
  </style>
  