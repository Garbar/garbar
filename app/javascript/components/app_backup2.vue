<template>
  <el-table-wrapper border="" stripe="" :data="items" :columns="columns" :pagination="pagination" :show-custom-header="true">
      <template slot-scope="props" slot="details-slot">
        <p>Title: {{ props.row.title }}</p>
        <p>Description: {{ props.row.description }}</p>
      </template>
     <template slot-scope="scope" slot="genres-slot">
       <el-tag
        v-for="tag in scope.row.genres"
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
        scopedSlot: 'details-slot' },
      { type: "expand",
        scopedSlot: 'details-slot'
      },
      { label: "Title",
        prop: "title",
        searchable: true,
        sortable: true
      },
      { label: "IMDB ID",
        prop: "imdb_id",
        searchable: true,
        sortable: true
      },
      { label: "Years",
        prop: "years",
      },
      { label: "Genres",
        prop: "genres",
        scopedSlot: 'genres-slot'
      }
      ];

      const items = [];
      const errors = [];
      const data = [];
      for (let i = 0; i < 96; i++) {
        data.push({
          key: i,
          name: `Edward King ${i}`,
          age: 32,
          address: `London, Park Lane no. ${i}`
        });
      }

      return {
        errors,
        data,
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
        console.log(response.data.length);
        this.items = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
    }
  };
</script>