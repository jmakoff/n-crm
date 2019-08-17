<template>
    <main v-if="user" class='app'>
      <aside class="sidebar">
        <Sidebar :value="sidebarItems"/>
      </aside>
      <router-view/>
    </main>
    <main class="login" v-else>
      <article class='credentials'>
        <form @submit.prevent="createSession">
          <p v-if="!Array.isArray(errors)">{{errors}}</p>
          <b-field
            label="Login"
            :type="getError('login') ? 'is-danger' : 'is-primary'"
            :message="getError('login')"
          >
              <b-input
                v-model="credentials.login"
                placeholder="Enter your login here"
              />
          </b-field>
          <b-field
            label="Password"
            :type="getError('pass') ? 'is-danger' : 'is-info'"
            :message="getError('pass')"
          >
            <b-input
              v-model="credentials.pass"
              placeholder="Enter your password here"
              type="password"
              password-reveal
            />
          </b-field>
          <b-button @click="logIn">Log in</b-button>
          <b-loading :active="loading" is-full-page/>
        </form>
      </article>
    </main>
</template>

<script>
import r from 'axios'

import menu from './menu'
import Sidebar from './components/Sidebar'

export default {
  name: 'app',
  components: { Sidebar },
  data () {
    return {
      user: null,
      credentials: {
        login: '',
        pass: '',
      },
      errors: [],
      loading: false,
    }
  },
  computed: {
    sidebarItems () {
      return menu
    }
  },
  methods: {
    async logIn() {
      this.errors = []
      this.loading = true
      try {
        this.user = await r.post( '/login', this.credentials)
        localStorage.setItem('user', JSON.stringify(this.user))
      } catch (e) {
        if (e.statusCode === 400) {
          this.errors = e.error
        }
      }
      this.loading = false
    },
    getError (field) {
      if (!Array.isArray(this.errors)) {
        return
      }
      const errorForField = this.errors.find(it => it.param === field)
      if (errorForField) {
        return errorForField.msg
      } else {
        return
      }
    }
  },
  mounted () {
    this.user = JSON.parse(localStorage.getItem('user'))
  },
}
</script>

<style lang="scss">
  @import "index";

  .login {
    display: flex;
    justify-content: center;

    .credentials {
      margin-top: 100px;
      width: 200px;
    }
  }
  .app {
    display: flex;
    height: 100%;

    .sidebar {
      width: 200px;

      padding: 10px;
      background-color: #B2ECE1;
    }
  }
</style>
