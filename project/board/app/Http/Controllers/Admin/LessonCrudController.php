<?php

namespace App\Http\Controllers\Admin;

use App\Http\Helper;
use App\Models\User;
use App\Models\Lesson;
use App\Models\Licence;
use App\Http\Requests\LessonRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class LessonCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class LessonCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\BulkDeleteOperation;


    // protected function generate_string($strength = 11) {
    //     $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    //     $input_length = strlen($permitted_chars);
    //     $random_string = '';
    //     for($i = 0; $i < $strength; $i++) {
    //         $random_character = $permitted_chars[mt_rand(0, $input_length - 1)];
    //         $random_string .= $random_character;
    //     }

    //     if( Lesson::where('slug', $random_string)->first() ) {
    //         $this->generate_string(9);
    //     }

    //     return $random_string;
    // }

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Lesson::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/meets');
        CRUD::setEntityNameStrings('встречу', 'встречи');

        if (backpack_user()->hasRole('user')) {
            CRUD::denyAccess(['update', 'create', 'delete', 'bulkDelete']);
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
        CRUD::column('user_id')->label('Организатор');
        CRUD::column('start_at')->label('Старт');
        $this->crud->addColumn([
            'name'        => 'status',
            'label'       => "Статус",
            'type'        => 'model_function',
            'function_name' => 'human_status'
        ]);
        CRUD::column('course_id')->label('Группа');
        $this->crud->addButtonFromView('line', 'go_to_meet', 'go_to_meet', 'beginning');


        /**
         * Columns can be defined using the fluent syntax or array syntax:
         * - CRUD::column('price')->type('number');
         * - CRUD::addColumn(['name' => 'price', 'type' => 'number']);
         */
    }

    protected function setupShowOperation()
    {
        CRUD::column('title')->label('Название');
        CRUD::column('user_id')->label('Организатор');
        CRUD::column('start_at')->label('Старт');
        CRUD::column('status')->label('Статус');
        CRUD::column('course_id')->label('Группа');
    }

    protected function helperCreateOperation()
    {
        CRUD::setValidation(LessonRequest::class);

        CRUD::field('title')->label('Название');
        CRUD::field('desc')->label('Описание')->type('ckeditor');
        CRUD::field('start_at')->type('datetime_picker')->label('Старт')->size(6);
        CRUD::field('slug')->default( \App\Http\Helper::generate_string(9, Lesson::class) )->size(6)->label('Ссылка');
        $this->crud->addField([
            'name'        => 'status',
            'label'       => "Статус",
            'type'        => 'select_from_array',
            'options'     => [1 => 'Запланированная', 2 => 'Завершенная', 3 => 'Отменена'],
            'allows_null' => false,
            'default'     => 1,
            'wrapper' => ['class' => 'form-group col-md-6']
        ]);

        CRUD::field('tribuna')->label('Трибуна')->size(6);

        CRUD::field('course_id')->label('Группа');
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {

        $this->helperCreateOperation();

        if( backpack_user()->hasRole('admin') ) {
            CRUD::field('user_id')->label('Организатор')->size(6);

            $this->crud->addField([
                'name' => 'pupils',
                'type' => 'select2_multiple',
                'label' => 'Участники'
            ]);
        } else {
            $this->crud->addField([
                'name'        => 'pupils',
                'label'       => "Участники",
                'type'        => 'select2_custom_from_array',
                'options'     => Helper::getMyPupils(),
                'allows_multiple' => true, // OPTIONAL; needs you to cast this to array in your model;
            ]);
        }

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
        $this->helperCreateOperation();

        if( backpack_user()->hasRole('admin') ) {
            CRUD::field('user_id')->label('Организатор')->size(6);

            $this->crud->addField([
                'name' => 'pupils',
                'type' => 'select2_multiple',
                'label' => 'Участники'
            ]);
        } else {
            $this->crud->addField([
                'name'        => 'pupils',
                'label'       => "Участники",
                'type'        => 'select2_custom_from_array',
                'options'     => Helper::getMyPupils(),
                'allows_multiple' => true, // OPTIONAL; needs you to cast this to array in your model;
                'value' => $this->crud->getCurrentEntry()->pupils()->pluck('id')->toArray()
            ]);
        }
    }
}
