<template>
<v-card max-width="400" class="pa-15" elevation="12">
              <v-card-title class="headline text-center">Sign In</v-card-title>
              <v-card-text>
                <v-form v-model="signinValid">
                  <v-text-field
                    v-model="signinData.username"
                    label="Email"
                    prepend-icon="mdi-email"
                    color="primary"
                    required
                  ></v-text-field>
                  <v-text-field
                    v-model="signinData.password"
                    label="Password"
                    prepend-icon="mdi-lock"
                    color="primary"
                    type="password"
                    required
                  ></v-text-field>
                  <v-btn color="primary" @click="signin" :disabled="!signinValid" class="mt-4" block>
                    Sign In
                  </v-btn>
                </v-form>
              </v-card-text>
            </v-card>
  </template>
  
  <script>
  export default {
    data() {
      return {
        signinValid: false,
        signinData: {
          username: '',
          password: '',
        },
      };
    },
    methods: {
      signin() {
        console.log('Sign-in data:', this.signinData);
        // Add logic to handle sign-in, like an API call
      },
    },
  };
  </script>
  