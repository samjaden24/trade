<template>
    <v-card max-width="600" class="pa-15" elevation="12">
      <v-card-text>
        <v-form ref="form" v-model="valid">
          <v-container>
            <v-row justify="center">
              <v-col cols="auto">
                <h1>Client Registration</h1>
              </v-col>
            </v-row>
  
            <v-row justify="space-around">
              <!-- First Name -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="firstName"
                  label="First Name"
                  placeholder="Enter your First Name"
                  :rules="[rules.required]"
                  prepend-icon="mdi-account"
                ></v-text-field>
              </v-col>
  
              <!-- Last Name -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="lastName"
                  label="Last Name"
                  placeholder="Enter your Last Name"
                  :rules="[rules.required]"
                  prepend-icon="mdi-account"
                ></v-text-field>
              </v-col>
  
              <!-- Email -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="signupData.email"
                  label="Email"
                  prepend-icon="mdi-email"
                  color="primary"
                  type="email"
                  :rules="[rules.required, rules.email]"
                  required
                ></v-text-field>
              </v-col>
  
              <!-- Phone Number -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="phoneNumber"
                  label="Phone Number"
                  placeholder="Enter your Phone Number"
                  :rules="[rules.required, rules.phone]"
                  prepend-icon="mdi-phone"
                ></v-text-field>
              </v-col>
  
              <!-- PAN Card Number -->
              <v-col>
                <v-text-field
                  v-model="panNumber"
                  label="PAN Card Number"
                  placeholder="Enter your PAN Number"
                  :rules="[rules.required, rules.pan]"
                  prepend-icon="mdi-card-account-details"
                ></v-text-field>
              </v-col>
  
              <!-- Password Field -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="signupData.password"
                  label="Password"
                  prepend-icon="mdi-lock"
                  color="primary"
                  type="password"
                  :rules="[rules.required]"
                  required
                ></v-text-field>
              </v-col>
  
              <!-- Confirm Password Field -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="signupData.confirmPassword"
                  label="Confirm Password"
                  prepend-icon="mdi-lock-check"
                  color="primary"
                  type="password"
                  :rules="[rules.required]"
                  required
                ></v-text-field>
              </v-col>
  
              <!-- Bank Name -->
              <v-col cols="12" sm="6" md="6">
                <v-select
                  v-model="bankName"
                  :items="bankList"
                  label="Bank Name"
                  :rules="[rules.required]"
                  prepend-icon="mdi-bank"
                  @change="updateBranches"
                ></v-select>
              </v-col>
  
              <!-- Branch Name -->
              <v-col cols="12" sm="6" md="6">
                <v-select
                  v-model="branchName"
                  :items="branchList"
                  label="Branch Name"
                  :rules="[rules.required]"
                  @change="updateIFSC"
                ></v-select>
              </v-col>
  
              <!-- IFSC Code -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="ifscCode"
                  label="IFSC Code"
                  placeholder="Enter the IFSC Code"
                  :rules="[rules.required]"
                ></v-text-field>
              </v-col>
  
              <!-- Account Number -->
              <v-col cols="12" sm="6" md="6">
                <v-text-field
                  v-model="accountNumber"
                  label="Account Number"
                  placeholder="Enter your 16 Digit Account Number"
                  :rules="[rules.required, rules.accountNumber]"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6" md="6">
              </v-col>
  
              <!-- Address -->
              <v-col cols="12">
                <v-textarea
                  v-model="address"
                  autocomplete="Address"
                  label="Address"
                  :rules="[rules.required]"
                  prepend-icon="mdi-home"
                ></v-textarea>
              </v-col>
  
              <!-- Submit Button -->
              <v-col cols="auto">
                <v-btn class="primary" @click="submission">Submit</v-btn>
              </v-col>
            </v-row>
          </v-container>
        </v-form>
      </v-card-text>
    </v-card>
  </template>
  
  <script>
  export default {
    data: () => ({
      valid: false,
      firstName: '',
      lastName: '',
      phoneNumber: '',
      panNumber: '',
      signupData: {
        email: '',
        password: '',
        confirmPassword: '',
      },
      bankName: null,
      branchName: null,
      ifscCode: '',
      accountNumber: '',
      address: '',
      branchList: [],
      bankList: ['HDFC', 'Karur Vysya Bank', 'SBI', 'IOB'],
      rules: {
        required: value => !!value || 'Required',
        email: value => {
          const pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
          return pattern.test(value) || 'Must be a valid e-mail.';
        },
        phone: value => {
          const pattern = /^[0-9]{10}$/;
          return pattern.test(value) || 'Must be a valid phone number.';
        },
        pan: value => {
          const pattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
          return pattern.test(value) || 'Must be a valid PAN number.';
        },
        accountNumber: value => {
          const pattern = /^[0-9]{16}$/;
          return pattern.test(value) || 'Must be a 16 digit account number.';
        },
      },
    }),
    methods: {
      updateBranches() {
        const bankDetails = this.$store.state.bankDetails[this.bankName];
        if (bankDetails) {
          this.branchList = bankDetails.branches.map(branch => branch.name);
          this.branchName = null; // Reset branch and IFSC
          this.ifscCode = '';
        } else {
          this.branchList = [];
        }
      },
      updateIFSC() {
        const selectedBranch = this.$store.state.bankDetails[this.bankName]?.branches.find(branch => branch.name === this.branchName);
        this.ifscCode = selectedBranch ? selectedBranch.ifsc : '';
      },
      submission() {
        if (this.signupData.password !== this.signupData.confirmPassword) {
          alert("Passwords don't match.");
          return;
        }
  
        if (this.$refs.form.validate()) {
          const signupDetails = {
            firstName: this.firstName,
            lastName: this.lastName,
            phoneNumber: this.phoneNumber,
            panNumber: this.panNumber,
            email: this.signupData.email,
            password: this.signupData.password,
            bankName: this.bankName,
            branchName: this.branchName,
            ifscCode: this.ifscCode,
            accountNumber: this.accountNumber,
            address: this.address,
          };
  
          console.log("Signup data:", signupDetails);
          // Add logic to handle signup, like an API call
        } else {
          console.log("Validation failed");
        }
      },
    },
  };
  </script>
  