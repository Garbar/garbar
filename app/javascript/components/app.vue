<template>
  <el-table-wrapper border="" stripe="" :data="items" :columns="columns" :pagination="pagination" :show-custom-header="true">
    <template slot-scope="scope" slot="operate-slot">
      <el-button @click="handleEdit(scope.$index, scope.row)" type="text" size="small">Edit</el-button>
      <el-button @click="handleClick" type="text">Detail</el-button>
    </template>
      <template slot-scope="props" slot="details-slot">
        <p>Username: {{ props.row.name }}</p>
      </template>
     <template slot-scope="scope" slot="address-slot">
       <el-tag
        v-for="tag in scope.row.address"
        :key="tag.city">
        {{tag.city}}
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
        {
        label: "Title",
        prop: "name",
        searchable: true,
        sortable: true
      }, {
        label: "Username",
        prop: "username",
      },
      {
        label: "Email",
        prop: "email",
        searchable: true,
        sortable: true
      },
      {
        label: "Address",
        prop: "address",
        searchable: true,
        sortable: true,
        scopedSlot: 'address-slot'
      },
      { label: 'Code',
      scopedSlot: 'operate-slot'
      }

      ];

      const items = [];
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
        handleClick() {
          console.log('click');
        },
        handleEdit(index, row) {
        console.log(index, row);
        },
        deleteRow(index, rows) {
          rows.splice(index, 1);
        },
        formatter(row, column) {
          console.log(row);
          return row.address.city+" "+row.address.street;
        }
    },
    onPageSizeChange(size) {
      console.log('onPageSizeChange, size:', size)
    },
    onPageCurrentChange(current) {
      console.log('onPageCurrentChange, current page:', current)
    },
    created() {
      axios.get(`http://jsonplaceholder.typicode.com/users`)
      .then(response => {
        // JSON responses are automatically parsed.
            // console.log(response.status);
            // console.log(response.statusText);
            // console.log(response.headers);
            // console.log(response.config);
        console.log(response.data.length);
        this.itemsSize = response.data.length
        this.items = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
    }
  };
</script>