<template>
  <div>
    <section class="section">
      <div class="container">
        <h2 class="title">Masters</h2>
        <div class='level'>
          <b-button @click="addMasterModal = true">Add</b-button>
        </div>
        <b-table
          class='container'
          :data="masters"
          :columns="columns"
          :loading="tableLoading"
        />
      </div>
      
    </section>
    <b-modal :active.sync="addMasterModal" has-modal-card>
      <MasterForm/>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'
import MasterForm from './components/MasterForm'

export default {
  components: { MasterForm },
  data () {
    return {
      masters: [],
      tableLoading: true,
      addMasterModal: false,
    }
  },
  async mounted () {
    this.masters = await axios.get('/users/masters').then(it => it.data)
    this.tableLoading = false;
  },
  computed: {
    'columns'() {
      return [
        {
          field: 'id',
          label: 'ID',
          width: '40',
          numeric: true
        },
        {
          field: 'name',
          label: 'Name',
          width: '100',
        },
        {
          field: 'login',
          label: 'login',
          width: '100',
        }
      ]
    }
  },
  methods: {
    async saveNewMaster (master) {
      try {
        await axios.post('/users/masters', master)
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>