<template>
  <v-container fluid class="light-blue lighten-4" style="height: 100vh">
    <v-row justify="center" align="center" style="height: 100%">
      <v-col cols="12" md="4" class="text-center">
        <img
          src="../assets/logo-blue.png"
          height="28"
          alt="FLATTRADE, A secure and reliable online stock trading platform"
          title="online stock trading platform-FLATTRADE"
        />
        <v-card class="white">
          <v-card-title class="justify-center white--text">Welcome Back, Admin</v-card-title>
          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="Email"
                required
                prepend-icon="mdi-email"
              ></v-text-field>
              <v-text-field
                v-model="password"
                :rules="passwordRules"
                label="Password"
                type="password"
                required
                prepend-icon="mdi-lock"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions class="justify-center">
            <v-btn color="blue" text @click="signIn" :disabled="!isFormValid" >
              <span class="black--text">Submit</span>
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapState } from 'vuex/dist/vuex.common.js';

export default {
  data() {
    return {
      email: "",
      password: "",
      valid: false,
      emailRules: [
        (v) => !!v || "Email is required",
        (v) => /.+@.+\..+/.test(v) || "Email must be valid",
      ],
      passwordRules: [
        (v) => !!v || "Password is required",
        (v) => v.length >= 6 || "Password must be at least 6 characters",
      ],
    };
  },
  computed: {
    ...mapState(['AdminLogin']),
    isFormValid() {
      return this.email && this.password && this.$refs.form.validate();
    },
  },
  methods: {
    resetForm() {
      this.email = "";
      this.password = "";
    },
    signIn() {
      if(this.email==this.AdminLogin.email && this.password==this.AdminLogin.password){
        console.log("Signed in Successfully")
        this.resetForm();
        this.$emit('login-success');
      }else{
        console.log("Enter valid Details")
        this.resetForm();
      }
      this.$refs.form.resetValidation()
    },
  },
};
</script>


<!-- <template>
  <v-container fluid class="white" style="height: 100vh">
      <img
        src="../assets/logo-blue.png"
        height="28"
        alt="FLATTRADE, A secure and reliable online stock trading platform"
        title="online stock trading platform-FLATTRADE"
      />
    <v-row justify="center" align="center" style="height: 100%">
      <v-col cols="12" md="4">
        <v-card class="blue">
          <v-card-title class="justify-center">Welcome Back,Admin</v-card-title>
          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="Email"
                required
                prepend-icon="mdi-email"
              ></v-text-field>
              <v-text-field
                v-model="password"
                :rules="passwordRules"
                label="Password"
                type="password"
                required
                prepend-icon="mdi-lock"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions class="justify-center">
            <v-btn color="white" text @click="signIn" :disabled="!isFormValid">
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: "",
      name: "",
      valid: false,
      nameRules: [(v) => !!v || "Name is required"],
      emailRules: [
        (v) => !!v || "Email is required",
        (v) => /.+@.+\..+/.test(v) || "Email must be valid",
      ],
      passwordRules: [
        (v) => !!v || "Password is required",
        (v) => v.length >= 6 || "Password must be at least 6 characters",
      ],
    };
  },
  computed: {
    isFormValid() {
      return this.email && this.password && this.$refs.form.validate();
    },
  },
  methods: {
    resetForm() {
      this.email = "";
      this.password = "";
    },
    signIn() {
      // Handle sign-in logic here
      // if(this.email!="" && this.password!=""){
      //   this.required=true
      // }
      alert(`Signing in with ${this.email}`);
      this.resetForm;
    },
  },
};
</script> -->