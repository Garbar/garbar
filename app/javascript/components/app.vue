<template>
  <el-table-wrapper border="" stripe="" :data="items" :columns="columns" :pagination="pagination" :show-custom-header="true">
      <template slot-scope="props" slot="details-slot">
        <p class="details"><strong>Years:</strong> {{ props.row.years }}</p>
        <p class="details"><strong>Actors:</strong> {{ props.row.actors }}</p>
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
  </el-table-wrapper>
</template>

<script>
  import axios from 'axios';

  export default {
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
          width: 200,
          searchable: true,
          scopedSlot: 'genres-slot'
        },
        { label: "Countries",
          prop: "countries",
          width: 200,
          searchable: true,
          scopedSlot: 'countries-slot'
        },
        { label: "Status",
          prop: "status",
          width: 150
        }
      ];

      const items = [];
      const errors = [];

      return {
        errors,
        items,
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
        console.log(response.data);
        this.items = response.data
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