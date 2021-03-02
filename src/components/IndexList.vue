<template>
  <div
    class="sidebar-list"
    v-if="playgrounds">
    <header class="px-3 py-2">
      <h6 class="mb-0">Playgrounds</h6>
      <small>Test and try out Axel-F formulas</small>
    </header>
    <ul class="index-list">
      <li class="p-3" v-for="{ name, formula, _id } in playgrounds" :key="_id">
        <router-link :to="{ name: 'Edit', params: { id: _id }}">
          {{ name || formula }}
        </router-link>
      </li>
      <li class="p-3">
        <router-link :to="{ name: 'New' }">
          <font-awesome-icon icon="plus" class="mr-1 small" />
          Add Playground
        </router-link>
      </li>
      <li
        v-if="!playgrounds.length"
        class="p-3">
        <p class="mb-0">No playgrounds yet. 🙆🏼‍♀️</p>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Index',
  mounted () {
    this.getPlaygrounds()
  },
  methods: {
    getPlaygrounds () {
      this.$store.state.axios.get('/playgrounds').then(({ data }) => {
        this.$store.commit('setPlaygrounds', data)
      })
    }
  },
  computed: {
    playgrounds () {
      return this.$store.state.playgrounds
    }
  }
}
</script>

<style lang="sass" scoped>
$white: rgba(255, 255, 255, 1)

.sidebar-list
  border-right: 1px solid rgba(38, 38, 38, 1)

  .index-list
    position: relative
    z-index: 1000
    width: 250px
    list-style: none
    padding: 0
    li
      color: white
      border-bottom: 1px solid rgba(38, 38, 38, 1)
      background-color: rgba(25, 25, 25, 1)
      &:first-child
        border-top: 1px solid rgba(38, 38, 38, 1)
    a
      color: white

  header
    z-index: 1000
    color: $white
    a
      color: $white !important

</style>
