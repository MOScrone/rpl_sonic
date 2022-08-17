<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Products;
use App\Models\Categories;
use Illuminate\Support\Facades\Auth;

class ProductsController extends Controller
{
    public function index(){
        if (!Auth::check()) {
            $products = Products::where('isActive',1)->orderBy('name')->get();
        } else {
            $products = Products::orderBy('name')->get();
        }
        return view('Dashboard',['products' => $products]);
    }

    public function tampilFormTambah(){
        $categories = Categories::get();

        return view('admin.FormTambah',['categories' => $categories]);
    }

    public function store(Request $r){
        $validated = $r->validate([
            'name' => 'required|unique:App\Models\Products,name',
            'price' => 'required|integer',
            'category_id' => 'required'
        ]);

        $product = Products::create($validated);

        return redirect('')->with('Message', 'Berhasil Ditambahkan');
    }

    public function tampilFormEdit($id){
        $product = Products::where('id',$id)->first();
        $categories = Categories::get();

        return view('admin.FormEdit', ['product' => $product, 'categories' => $categories]);
    }

    public function patch(Request $r, $id) {
        $validated = $r->validate([
            'name' => 'required',
            'price' => 'required|integer',
            'category_id' => 'required'
        ]);
        $validated['isActive'] = $r->isActive;

        $product = Products::where('id',$id)->update($validated);
        return redirect('')->with('Message', 'Berhasil Diubah');
    }

    public function deleteData($id) {
        Products::where('id',$id)->delete();

        return redirect('')->with('Message', 'Berhasil Dihapus');
    }

    public function setActive($id) {
        Products::where('id', $id)->update([
            'isActive' => 1
        ]);

        return redirect('')->with('Message', 'Berhasil Diaktifkan');
    }

    public function setNonActive($id) {
        Products::where('id', $id)->update([
            'isActive' => 0
        ]);

        return redirect('')->with('Message', 'Berhasil Di-non-aktifkan');
    }
}
