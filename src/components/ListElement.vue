<template>
  <div class="list-group-item card-background loading-animation">
    <div class="row align-items-center">
      <div class="col">
        {{ name }}
      </div>
      <div class="col">
        <span class="badge badge-secondary">
          {{ formula }}
        </span>
      </div>
      <div class="col d-flex align-items-center justify-content-end">
        <router-link
          :to="{ name: 'Edit', params: { id: _id } }"
          class="mr-2 btn btn-outline-secondary btn-sm"><font-awesome-icon icon="search" /> Inspect</router-link>
        <button
          class="btn btn-outline-danger btn-sm"
          @click="deletePlayground">
          <font-awesome-icon icon="trash" />
          Delete
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListElement',
  props: {
    _id: Number,
    formula: String,
    sample: String,
    name: String
  },
  methods: {
    deletePlayground () {
      if (window.confirm('Are you sure you want to delete this playground?')) {
        this.$store.state.axios.delete(`/playgrounds/${this._id}`).then(() => {
          this.$store.commit('removePlayground', this._id)
        })
      }
    }
  }
}
</script>

<style lang="sass">

// eslint-disable-next-line max-len
$border-radius: 1rem

.btn
  border-radius: $border-radius !important
  &.btn-outline-secondary
    &:hover
      color: white !important

.list-group-item
  background-color: rgba(25, 25, 25, 1) !important
  color: white
  transition: all .2s ease-out
  &:first-child
    border-radius: $border-radius $border-radius 0 0 !important
  &:last-child
    border-radius: 0 0 $border-radius $border-radius !important

</style>
