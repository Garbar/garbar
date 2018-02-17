<template>
<div>
  <el-table
    :data="items"
    border 
    :default-sort="{prop: 'name', order: 'descending'}"
    style="width: 100%">
    <el-table-column type="expand">
      <template slot-scope="props">
        <p>Username: {{ props.row.body }}</p>
      </template>
    </el-table-column>
    <el-table-column
      type="index">
    </el-table-column>
    <el-table-column
      prop="email"
      sortable
      label="Email" >
      </el-table-column>
    <el-table-column
        prop="name"
        sortable
        label="Name"
    >
      </el-table-column>
      <el-table-column
        prop="address"
        label="Address"
        formatter="formatter">
      </el-table-column>
      <el-table-column
        fixed="right"
        label="Operations"
        width="120">
        <template slot-scope="scope">
          <el-button @click="handleClick" type="text" size="small">Detail</el-button>
          <el-button @click="handleEdit(scope.$index, scope.row)" type="text" size="small">Edit</el-button>
          <el-button
            @click.native.prevent="deleteRow(scope.$index, items)"
            type="text"
            size="small">
            Remove
          </el-button>
        </template>
      </el-table-column>
  </el-table>
  <div class="block">
   <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page.sync="currentPage1"
      :page-size="10"
      layout="total, prev, pager, next"
      :total="100">
    </el-pagination>
</div>
</div>
</template>

  <script>
  import axios from 'axios';

    export default {
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
          return row.address.street+" "+row.address.street;
        },
      handleSizeChange(val) {
        console.log(`${val} items per page`);
      },
      handleCurrentChange(val) {
        console.log(`current page: ${val}`);
      }
    },
      data() {
        return {
          items: [],
          currentPage1: 5,
          itemsSize: null,
          errors: []
        }
      },
      created() {
        axios.get(`http://jsonplaceholder.typicode.com/comments`)
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
    }
  </script>