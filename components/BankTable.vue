<template>
  <v-data-table
    :headers="headers"
    :items="banks"
    class="elevation-1"
  >
    <template v-slot:item.actions="{ index }">
      <v-icon small @click="$emit('edit', index)">mdi-pencil</v-icon>
      <v-icon small @click="$emit('delete', index)">mdi-delete</v-icon>
    </template>
  </v-data-table>
</template>

<script>
export default {
  props: {
    banks: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      headers: [
        { text: "Bank Name", value: "bname" },
        { text: "Branch Name", value: "brname" },
        { text: "IFSC Code", value: "ifsccode" },
        { text: "Address", value: "address" },
        { text: "Actions", value: "actions", sortable: false },
      ],
    };
  },
};
</script>
