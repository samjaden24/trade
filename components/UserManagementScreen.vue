<template>
    <v-container>
      <h1>User Management</h1>
  
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-row>
          <v-col cols="12" sm="6">
            <v-text-field label="User ID" v-model="userId" readonly></v-text-field>
          </v-col>
  
          <v-col cols="12" sm="6">
            <v-text-field label="Username" v-model="username" :rules="[rules.required]"></v-text-field>
          </v-col>
  
          <v-col cols="12" sm="6">
            <v-select label="Role" v-model="role" :items="roles" :rules="[rules.required]"></v-select>
          </v-col>
  
          <v-col cols="12" sm="6">
            <v-select label="Status" v-model="status" :items="statuses" :rules="[rules.required]"></v-select>
          </v-col>
        </v-row>
  
        <v-row>
          <v-col cols="12" sm="4" md="4"> 
            <v-btn @click="createUser" color="primary">Create User</v-btn>
          </v-col>
          <v-col cols="12" sm="4" md="4">
            <v-btn @click="updateUser" color="success">Update User</v-btn>
          </v-col>
          <v-col cols="12" sm="4" md="4">
          <v-btn @click="deleteUser" color="error">Delete User</v-btn>
          </v-col>
        </v-row>
      </v-form>
    </v-container>
  </template>
    
  <script>
  export default {
    data() {
      return {
        valid: false,
        userId: '12345', // Example User ID
        username: '',
        role: null,
        status: null,
        roles: ['Client', 'BackOffice Admin', 'Billing Approver'],
        statuses: ['Active', 'Inactive'],
        rules: {
          required: value => !!value || 'Required.',
        },
      };
    },
    methods: {
      createUser() {
        if (this.$refs.form.validate()) {
          // Logic to create a user
          console.log('Creating user:', { username: this.username, role: this.role, status: this.status });
          // Reset form if necessary
          this.resetForm();
        } else {
          console.log('Form is invalid');
        }
      },
      updateUser() {
        if (this.$refs.form.validate()) {
          // Logic to update the user
          console.log('Updating user:', { userId: this.userId, username: this.username, role: this.role, status: this.status });
          // Reset form if necessary
          this.resetForm();
        } else {
          console.log('Form is invalid');
        }
      },
      deleteUser() {
        // Logic to delete the user
        console.log('Deleting user:', this.userId);
        // Reset form if necessary
        this.resetForm();
      },
      resetForm() {
        this.username = '';
        this.role = null;
        this.status = null;
        this.$refs.form.reset();
      }
    },
  };
  </script>
  
  <style scoped>
  h1 {
    margin-bottom: 20px;
  }
  </style>