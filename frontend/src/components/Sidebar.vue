<template>
  <b-menu>
    <b-menu-list label="Mint Bear">
      <b-menu-item
        v-for="i of value"
        :key='i.path'
        :to="i.path"
        :label="i.name"
        :active="i == currentItem"
        tag="router-link">
      </b-menu-item>
    </b-menu-list>
  </b-menu>
</template>

<script>
export default {
  props: {
    value: { type: Array, required: true }
  },
  computed: {
    currentItem() {
      return this.value.find(it => it.path == this.$route.path)
    }
  }
}
</script>