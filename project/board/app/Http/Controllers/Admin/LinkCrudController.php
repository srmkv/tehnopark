<?php

namespace App\Http\Controllers\Admin;

use App\Http\Helper;
use App\Http\Requests\LinkRequest;
use App\Models\Link;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class LinkCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class LinkCrudController extends CrudController
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
        CRUD::setModel(\App\Models\Link::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/link');
        CRUD::setEntityNameStrings('ссылку', 'ссылки');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::column('active')->type('check')->label('Активна');
        // $this->crud->addColumn([
        //     'name' => 'slug',
        //     'type' => 'link',
        //     'prefix' => url('/') . '/invite/',
        //     'label' => 'Ссылка'
        // ]);
        $this->crud->addColumn([
            'name'        => 'mysocial',
            'label'       => "Поделится",
            'type'        => 'model_function',
            'function_name' => 'social'
        ]);
        //CRUD::column('slug')->type('url');
        if( backpack_user()->hasRole('admin') ) {
            CRUD::column('user')->label('Организатор');
        }
        CRUD::column('course')->label('Группа');
        CRUD::column('lesson')->label('Встреча');
        CRUD::column('limit')->label('Лимит');

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
        CRUD::setValidation(LinkRequest::class);
        CRUD::field('slug')->default(Helper::generate_string(9, Link::class))->size(4)->label('Ссылка');
        CRUD::field('limit')->label('Лимит')->size('4');
        //CRUD::field('active')->attributes(['class' => 'pt-3'])->label('Активно')->size('4');
        $this->crud->addField([
            'name' => 'active',
            'label' => 'Активно',
            'wrapper'   => [
                'class'      => 'form-group col-md-4 pt-5'
            ]
        ]);
        $this->crud->addField([
            'name' => 'course_id',
            'type' => 'select2',
            'entity' => 'course',
            'label' => 'Группа'
        ]);
        $this->crud->addField([
            'name' => 'lesson_id',
            'type' => 'select2',
            'entity' => 'lesson',
            'label' => 'Встреча'
        ]);

        $this->crud->addField(['name' => 'user_id', 'type' => 'hidden', 'value' => backpack_user()->id]);

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
