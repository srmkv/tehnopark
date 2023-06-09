<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\LicenceTypeRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class LicenceTypeCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class LicenceTypeCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\LicenceType::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/licence-type');
        CRUD::setEntityNameStrings('тип лицензии', 'типы лицензий');

        if (!backpack_user()->hasRole('admin')) {
            CRUD::denyAccess(['list', 'show', 'update', 'create', 'delete']);
        }
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::column('title')->label('Название');
        CRUD::column('pupils')->label('Участников');
        CRUD::column('active')->label('Активна')->type('check');
        CRUD::column('board')->label('Доска')->type('check');
        CRUD::column('price')->label('Цена');

        /**
         * Columns can be defined using the fluent syntax or array syntax:
         * - CRUD::column('price')->type('number');
         * - CRUD::addColumn(['name' => 'price', 'type' => 'number']);
         */
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(LicenceTypeRequest::class);

        CRUD::field('title')->label('Название');
        CRUD::field('desc')->label('Описание')->type('ckeditor');
        CRUD::field('pupils')->label('Количество участников')->size(6);

        CRUD::field('active')->label('Активно')->size(3);
        CRUD::field('board')->label('Доска')->size(3);
        CRUD::field('price')->label('Цена мес')->size(6);
        CRUD::field('price_year')->label('Цена год')->size(6);
        CRUD::field('popup_html')->label('HTML всплывающее окно')->type('textarea');

        /**
         * Fields can be defined using the fluent syntax or array syntax:
         * - CRUD::field('price')->type('number');
         * - CRUD::addField(['name' => 'price', 'type' => 'number']));
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
