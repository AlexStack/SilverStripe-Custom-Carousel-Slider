<?php

namespace SSCustomCarouselSlider\Model;

use Page;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;

class CustomSliderImage extends DataObject
{

    private static $table_name = 'SSC_CustomSliderImage';

    private static $db = [
        'Title'         => 'Varchar',
        'LinkTo'        => 'Varchar',
        'Content'       => 'Text',
        'Sort'          => 'Int'
    ];


    private static $has_one = [
        'ParentPage'    => Page::class,
        'Image'         => Image::class,
    ];


    private static $owns = [
        'Image'
    ];


    private static $casting = array(
        'Thumbnail' => 'Varchar'
    );


    private static $summary_fields = array(
        'Thumbnail' => 'Image',
        'Title'     => 'Title',
        'LinkTo'    => 'Link To',
    );


    private static $default_sort = "Sort ASC";


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->removeByName('ParentPageID');
        $fields->removeByName('Sort');

        return $fields;
    }

    public function getThumbnail()
    {
        if($this->Image()) {
            return $this->Image()->CMSThumbnail();
        } else {
            return 'Image not set';
        }
    }
    
}
