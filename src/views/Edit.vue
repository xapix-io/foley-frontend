<template>
  <div>
    <Editor v-bind="localPlayground" @playground-updated="updatePlayground" />
    <footer>
      <div class="input-group input-group-sm">
        <input type="text" v-model="localPlayground.name" class="form-control rounded-0" placeholder="a very complex task">
      </div>
      <button class="btn btn-outline-success btn-sm w-100 d-block rounded-0" @click="savePlayground">
        <font-awesome-icon icon="check" class="mr-1 small" />
        Save
      </button>
    </footer>
  </div>
</template>

<script>
import Editor from '@/components/Editor.vue'

export default {
  name: 'Edit',
  components: {
    Editor
  },
  data () {
    return {
      localPlayground: {
        name: ''
      }
    }
  },
  watch: {
    '$route.params.id': {
      handler (id) {
        this.getPlayground(id)
      },
      immediate: true
    }
  },
  methods: {
    getPlayground (id) {
      this.$store.state.axios.get(`/playgrounds/${id}`).then(({ data }) => {
        this.localPlayground = data
      })
    },
    updatePlayground (playground) {
      this.localPlayground = { ...this.localPlayground, ...playground }
    },
    savePlayground () {
      this.$store.state.axios.put(`/playgrounds/${this.$route.params.id}`, this.localPlayground).then(() => {
        this.$router.push({
          name: 'Index'
        })
      })
    }
  }
}
</script>

<style lang="sass" scoped>
$border-radius: 1rem

a
  color: black !important

.card
  border-radius: $border-radius !important
</style>
