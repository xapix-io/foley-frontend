<template>
  <div>
    <Editor @playground-updated="updatePlayground" />
    <footer>
      <!-- <div class="input-group input-group-sm">
        <input type="text" v-model="playground.name" class="form-control rounded-0" placeholder="a very complex task">
      </div> -->
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
  name: 'Detail',
  components: {
    Editor
  },
  data () {
    return {
      playground: {
        name: ''
      }
    }
  },
  methods: {
    updatePlayground (playground) {
      this.playground = { ...playground }
    },
    savePlayground () {
      this.$store.state.axios.post('/playgrounds', this.playground).then(({ data }) => {
        this.$store.commit('addPlayground', data)
        this.$router.push({
          name: 'Edit',
          params: {
            id: data._id
          }
        })
      })
    }
  }
}
</script>
