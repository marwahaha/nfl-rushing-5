<template>
<div id="app">
  <b-container fluid>
    <b-row align-h="between">
      <b-col md="6" class="my-1">
        <b-form-group class="mb-0 py-5">
          <b-input-group>
            <h1 class="pr-5">Filter</h1>
            <b-form-input v-model="filter" placeholder="Type to Search" />
            <b-input-group-append>
              <b-btn :disabled="!filter" @click="filter = ''">Clear</b-btn>
            </b-input-group-append>
          </b-input-group>
        </b-form-group>
      </b-col>
      <b-col md="1" class="my-1 py-5">
        <b-btn @click="download">Download CSV</b-btn>
      </b-col>
    </b-row>
    
    <b-row align-h="center">
      <pulse-loader :loading="!items"></pulse-loader>
      <b-table striped
               hover
               v-if="items"
               v-model="displayed_items"
               :items="items"
               :fields="fields"
               :filter="filter"
               ></b-table>
    </b-row>
  </b-container>

</div>
</template>

<script>
import PulseLoader from 'vue-spinner/src/PulseLoader.vue'
import axios from 'axios';
import { fields } from './fields.js';

export default {
  name: 'app',
  data () {
    return {
      items: null,
      fields: fields,
      filter: null,
      displayed_items: null
    }
  },
  components: {
    PulseLoader
  },
  mounted () {
    axios
      .get('http://localhost:4000/api/players')
      .then(response => (this.items = Object.values(response.data)[0]))
  },
  computed: {
    csv_headers: function() {
      //Being computed, will change with the rushing_json file 
      return Object.keys(this.fields)
    }
  },
  methods: {
    download () {
      var csv_headers = this.csv_headers
      var displayed_items = this.displayed_items
      var csv = ''
      csv += csv_headers.join(',')
      csv += '\n'
      
      displayed_items.forEach(function(item) {
        var ctr = 0
        csv_headers.forEach(function(header) {
          if (ctr > 0) csv += ','
          
          var value = item[header]

          //Get rid of all comma, if any in value, for correct CSV
          if (typeof(value) == "string") csv += value.replace(/,/, '')
          else csv += value

          ctr++
        })
        csv += '\n'
      })

      if (displayed_items.length === 0) return

      //Create hidden anchor link on webpage that hyperlinks to the file just created in memory
      var link = document.createElement('a')
      link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv))
      link.setAttribute('download', 'nfl_rushing.csv')
      link.style.display = 'none'

      //Clink link and destroy from page
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    }
  }
}
</script>
