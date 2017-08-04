<?php

class User extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id_user;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldfirstname;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldlastname;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldusername;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $fldpassword;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldinstalasi;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $fldpoli;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $fldakses;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("aplous_data");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'user';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]|User
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
