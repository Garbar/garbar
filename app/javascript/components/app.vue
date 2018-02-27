<template>
  <el-table-wrapper border="" stripe="" :data="items" :columns="columns" :pagination="pagination" :show-custom-header="true">
      <template slot-scope="props" slot="details-slot">
        <p class="details"><strong>Years:</strong> {{ props.row.years }}</p>
        <p class="details"><strong>Actors:</strong> {{ props.row.actors }}</p>
        <p class="details"><strong>My notes:</strong><vue-markdown> {{ props.row.note.description }}</vue-markdown></p>
        <p class="details"><strong>Characters:</strong><vue-markdown> {{ props.row.note.characters}}</vue-markdown></p>
      </template>
      <template slot-scope="scope" slot="genres-slot">
        <el-tag
          v-for="tag in scope.row.genres"
          :key="tag.title">
          {{tag.title}}
        </el-tag>
      </template>
      <template slot-scope="scope" slot="countries-slot">
        <el-tag
          v-for="tag in scope.row.countries"
          :key="tag.title">
          {{tag.title}}
        </el-tag>
      </template>
      <template slot-scope="scope" slot="status-slot">
        <el-tag :type="scope.row.status === 'dead' ? 'info' : 'success'" close-transition="">
          {{scope.row.status}}
        </el-tag>
      </template>
      <template slot-scope="scope" slot="operate-slot">
        <a v-bind:href="'movies/'+scope.row.id+''"><i class="el-icon-view"></i></a>
        <a v-bind:href="'movies/'+scope.row.id+'/edit'"><i class="el-icon-edit"></i></a>
      </template>
  </el-table-wrapper>
</template>

<script>
  import axios from 'axios';
  import VueMarkdown from 'vue-markdown';

  export default {
    components: {
      'vue-markdown': VueMarkdown
    },
    data() {
      const columns = [
        { type: "expand",
          label: "Details",
          scopedSlot: 'details-slot' },
        { label: "IMDB ID",
          prop: "imdb_id",
          width: 150,
          searchable: true,
          sortable: true
        },
        { label: "Title",
          prop: "title",
          width: 200,
          searchable: true,
          sortable: true
        },
        { label: "Description",
          prop: "description"
        },
        { label: "Genres",
          prop: "genres",
          columnKey: 'genres',
          width: 200,
          filters: [{text: 'crime', value: 'crime'},
                    {"text": "comedy", "value": "comedy"},
                    {"text": "drama", "value": "drama"},
                    {"text": "mystery", "value": "mystery"},
                    {"text": "thriller", "value": "thriller"},
                    {"text": "sci-fi", "value": "sci-fi"},
                    ],
          filterMethod: this.filterGenres,
          scopedSlot: 'genres-slot'
        },
        { label: "Countries",
          prop: "countries",
          width: 200,        
          scopedSlot: 'countries-slot',
          filters: [{"text": "germany", "value": "germany" },
                    {"text": "france", "value": "france" },
                    {"text": "usa", "value": "usa"},
                    {"text": "sweden", "value": "sweden"},
                    {"text": "uk","value": "uk" },
                    { "text": "canada", "value": "canada"},
                    { "text": "australia", "value": "australia"}
                    ],
          filterMethod: this.filterCountries,
        },
        { label: "Status",
          prop: "status",
          width: 100,
          scopedSlot: 'status-slot'
        },
        { label: "Bechdel's test",
          prop: "note.bechdel",
          width: 100
        },
        { label: "Operations",
          scopedSlot: 'operate-slot',
          width: 100
        },
      ];

      const items = [];
      const errors = [];
      const genre = [];

      return {
        errors,
        items,
        genre,
        columns,
        pagination: {
          pageSize: 10,
          layout: 'total, sizes, prev, pager, next',
          pageSizes: [10, 20, 50, 100],
          onSizeChange: this.onPageSizeChange,
          onCurrentChange: this.onPageCurrentChange
        }
      };
    },
    methods: {
      handleEdit(index, row) {
        console.log(index, row);
        // window.location.href = "/movies/22/edit"
      },
      filterGenres(value, row) {
        const copy = [];
        row.genres.forEach(function(element) {
          copy.push(element.title)
         });
        if (copy.includes(value)) return row;
      },
      filterCountries(value, row) {
        const copy = [];
        row.countries.forEach(function(element) {
          copy.push(element.title)
         });
        if (copy.includes(value)) return row;
      },
      filterGenre() {
        genre.forEach(function(element) {
          data.push({
            text: element.text,
            value: element.value
          });
          console.log(data);
        })
      }
    },
    onPageSizeChange(size) {
      console.log('onPageSizeChange, size:', size)
    },
    onPageCurrentChange(current) {
      console.log('onPageCurrentChange, current page:', current)
    },
    created() {
      axios.get(`/movies.json`)
      .then(response => {
        // console.log(response.data);
        this.items = response.data
      })
      .catch(e => {
        this.errors.push(e)
      }),
      axios.get(`/genres.json`)
      .then(response => {
        console.log(response.data);
        this.genre = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
    }
  };
</script>
<style scoped>
  .details {
    font-weight: bold;
  }
</style>