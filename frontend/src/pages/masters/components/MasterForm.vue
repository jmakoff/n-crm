<template>
  <div class="card">
    <header class="card-header">
      <div class="card-header-title">
        Add new master
      </div>
    </header>
    <div class="card-content">
      <b-field label="Name">
        <b-input v-model="name" ref="name" required/>
      </b-field>
      <b-field label="Surname">
        <b-input v-model="surname" ref="surname" required/>
      </b-field>
      <b-field label="Login">
        <b-input v-model="login" ref="login" required/>
      </b-field>
      <b-field label="Password">
        <b-input v-model="password" ref="password" required/>
      </b-field>
    </div>
    <div class="card-footer">
      <b-field position="is-centered">
        <b-button :disabled="Boolean(errors.length)" @click='save'>
          Save
        </b-button>
      </b-field>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      name: null,
      surname: null,
      login: null,
      password: null,
      errors: [],
    }
  },
  methods: {
    async save () {
      const master = {
        name: this.name,
        surname: this.surname,
        login: this.login,
        password: this.password
      }
      Object.keys(this.$refs).forEach(it => {
        this.$refs[it].checkHtml5Validity()
        if (!this.$refs[it].isValid) {
          this.errors.push(it)
        }
      })
      try {
        await axios.post('/users/masters', master)
      } catch (e) {
        console.log(e.stack)
      }
    }
  }
}
</script>